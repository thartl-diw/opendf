/*----------------------------------------------------------------------------------
  csv2dta.ado: loads data from csvs including meta data to build a stata dataset
    Copyright (C) 2024  Tom Hartl (thartl@diw.de)

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    For a copy of the GNU General Public License see <http://www.gnu.org/licenses/>.

-----------------------------------------------------------------------------------*/
*! csv2dta.ado: loads data from csvs including meta data to build a stata dataset
*! version 0.1 February, 14 2024 - first draft
program define csv2dta
	syntax, csv_loc(string) [SAVE(string) REPLACE CLEAR]
	local replaceit 0
		if (`"`replace'"' != "") local replaceit 1
		
	local saveit 0
	if (`"`save'"' != "") {
		local saveit 1
		local save: subinstr local save "\" "`c(dirsep)'", all
		local save `save'
	}

	local clearit 0
		if (`"`clear'"' != "") local clearit 1

	if `replaceit' == 1 & `saveit' == 0 {
		noisily: display as error "option {bf:replace} requires option {bf:save}"
		exit 459
	}	
	if `replaceit' == 0 & `saveit' == 1 {
		capture: confirm file "`save'"
		if _rc == 0 {
			noisily: display as error "file `save' already exists"
			exit 602
		} 
	}
	local saveit 0
	if (`"`save'"' != "") {
		local saveit 1
		local save: subinstr local save "\" "`c(dirsep)'", all
		local save `save'
	}


	*replace backlashes with lashes
	quietly: local csv_loc: subinstr local csv_loc "\" "`c(dirsep)'", all


	*Directory where to save csvs
	quietly: import delimited "`csv_loc'\dataset.csv", varnames(1) case(preserve) encoding(UTF-8) `clear'

	*count number of characteristics
	local dataset_nchar = 0
	*loop over each characteristic (column)
	*The name of characteristic 1 is saved in local macro dataset_char1_name
	*The value of characteristic 1 is saved in local macro dataset_char1_label
	foreach var of varlist _all {
		local dataset_nchar = `dataset_nchar'+1
		local dataset_char`dataset_nchar'_name = "`var'"
		local dataset_char`dataset_nchar'_label = `var' in 1
	}


	quietly: import delimited "`csv_loc'\variables.csv", varnames(1) case(preserve) encoding(UTF-8) clear
	*number of variables
	local _nvar = _N
	*loop over each variable (row)
	forvalues i=1(1)`_nvar' {
		*counter for number of characteristics
		local _nchar = 0
		*loop over each characteristic (column)
		*The name of characteristic 1 of variable 1 is saved in local macro _var1_char_name1
		*The value of characteristic 1 of variable 1 is saved in local macro _var1_char_label1
		foreach var of varlist _all {
			local _nchar = `_nchar'+1
			local _var`i'_char_name`_nchar'= "`var'"
			local _var`i'_char_label`_nchar'= `var' in `i'
		}
	}
	 	
	 *Import variable value labels
	quietly: import delimited "`csv_loc'\categories.csv", varnames(1) case(preserve) encoding(UTF-8) clear

	*save row numbers (number of value labels)
	local nvalue_labels=`r(N)'



	*loop over each value label (each row of dataset)
	forvalues i=1/`nvalue_labels'{
		if (`i'==1){
			*counter for number of variables to label
			local n_variable_to_label=1
			*counter for number of value label for this variable
			local nvalues=1
			*Save variable name as local
			local _varname`n_variable_to_label' = variable in `i'
			*save value of value label as local
			local _var`n_variable_to_label'_value`nvalues' = value in `i'
			*save language label of value as local
			foreach x of varlist _all{
				if strpos("`x'", "label")>0{
					if ("`x'" == "label"){
						local _var`n_variable_to_label'_label`nvalues' = `x'[`i']
					} 
					else {
						local _label_language = subinstr("`x'", "label_", "", .)
						local _var`n_variable_to_label'_label`nvalues'_lan`_label_language' = `x'[`i']
					}
					
				}
			}
			
			
		}
		if(`i'>1){
			local j = `i'-1
			local actual_var=variable in `i'
			local last_var=variable in `j'
			if ("`actual_var'" == "`last_var'"){
				local nvalues=`nvalues'+1
				local _var`n_variable_to_label'_value`nvalues' = value in `i'
				foreach x of varlist _all{
					if strpos("`x'", "label")>0{
						if ("`x'" == "label"){
							local _var`n_variable_to_label'_label`nvalues' = `x'[`i']
						} 
						else {
							local _label_language = subinstr("`x'", "label_", "", .)
							local _var`n_variable_to_label'_label`nvalues'_lan`_label_language' = `x'[`i']
						}
					}
				}		
			}
			if ("`actual_var'" != "`last_var'"){
				local _var`n_variable_to_label'_nvals = `nvalues'
				local nvalues=1
				local n_variable_to_label=`n_variable_to_label'+1
				local _varname`n_variable_to_label' = "`actual_var'"
				local _var`n_variable_to_label'_value`nvalues' = value in `i'
				foreach x of varlist _all{
					if strpos("`x'", "label")>0{
						if ("`x'" == "label"){
							local _var`n_variable_to_label'_label`nvalues' = `x'[`i']
						} 
						else {
							local _label_language = subinstr("`x'", "label_", "", .)
							local _var`n_variable_to_label'_label`nvalues'_lan`_label_language' = `x'[`i']
						}
					}
				}
			}
		}
		if (`i'==`nvalue_labels'){
			local _var`n_variable_to_label'_nvals = `nvalues'
		}
	}

	
	*Import Data
	quietly: import delimited "`csv_loc'\data.csv", varnames(1) case(preserve) encoding(ISO-8859-9) clear
	local default_renamed=0
	local language_counter=0

	*assign dataset labels and characteristics
	forvalues i=1/`dataset_nchar' {
			if (strpos("`dataset_char`i'_name'", "label")>0){
				if ("`dataset_char`i'_name'"=="label"){
					label data "`dataset_char`i'_label'"
				}
				else {
					local _label_language = subinstr("`dataset_char`i'_name'", "label_", "", .)
					if `default_renamed'==1 {
						quietly: label language `_label_language', new
						local language_counter=`language_counter'+1
						local _language`language_counter'="`_label_language'"
					}
					if `default_renamed'==0 {
						quietly: label language `_label_language', rename
						local default_renamed=1
						local language_counter=`language_counter'+1
						local _language`language_counter'="`_label_language'"
					}
					quietly: label data "`dataset_char`i'_label'"
				}
				
			}
		if (strpos("`dataset_char`i'_name'", "label")==0){
			char _dta[`dataset_char`i'_name'] "`dataset_char`i'_label'"
		}
	}

	*assign variable labels and characteristics
	forvalues i=1(1)`_nvar' {
		forvalues j=1(1)`_var`i'nchar'{
			if ("`_var`i'_char_name`j''"=="variable"){
				local _varcode="`_var`i'_char_label`j''"
				}
			if strpos("`_var`i'_char_name`j''", "label")>0{
					if ("`_var`i'_char_name`j''"=="label"){
						label var `_varcode' "`_var`i'_char_label`j''"
					}
					if ("`_var`i'_char_name`j''"!="label"){
						local _label_language = subinstr("`_var`i'_char_name`j''", "label_", "", .)
						capture label language `_label_language'
						if _rc == 111{
							quietly: label language `_label_language', new
							local language_counter=`language_counter'+1
							local _language`language_counter'="`_label_language'"
							di "{red: Warning: No Dataset Label defined for Language{it: `_label_language'}.}"
						}
						quietly: label var `_varcode' "`_var`i'_char_label`j''"
					}
					
					
				}
			if "`_var`i'_char_name`j''"!="variable" & strpos("`_var`i'_char_name`j''", "label")==0 {
				char `_varcode'[`_var`i'_char_name`j''] "`_var`i'_char_label`j''"
			}
		}
	}
	foreach var of varlist _all{
		forvalues l = 1/`language_counter'{
			quietly: label language `_language`l''
			local _varlabel : variable label `var'
			if "`_varlabel'" == ""{
				di "{red: Warning: No Label defined for Variable{it: `var'} for Language{it: `_language`l''}.}"
			}
		}
	}
		
	*Build value labels from locals
	forvalues i=1/`n_variable_to_label'{
		forvalues j=1/`_var`i'_nvals'{
			if (`j'==1){
				if `language_counter'>0{
					forvalues l = 1/`language_counter'{
						if "`_var`i'_label`j'_lan`_language`l'''" != ""{
							label define _var`i'_labels_`_language`l'' `_var`i'_value`j'' "`_var`i'_label`j'_lan`_language`l'''" 
						}
					}
				}
				else {
					label define _var`i'_labels `_var`i'_value`j'' "`_var`i'_label`j''"
				}
				
			}
			if `j'>1 {
				if `language_counter'>0{
					forvalues l = 1/`language_counter'{
						if "`_var`i'_label`j'_lan`_language`l'''" != ""{
							label define _var`i'_labels_`_language`l'' `_var`i'_value`j'' "`_var`i'_label`j'_lan`_language`l'''", add
						}
					}
				}
				else {
					label define _var`i'_labels `_var`i'_value`j'' "`_var`i'_label`j''", add
				}
				
			}
		}
	}

	*Assign value labels to non-String Variables
	forvalues i=1/`n_variable_to_label'{
		local _variable_type : type `_varname`i''
		if strpos("`_variable_type'", "str") == 1 {
			di "{red: Warning: The variable{it: `_varname`i''} was not labelled because it is a string variable.}"
		}
		if strpos("`_variable_type'", "str") != 1 {
			if `language_counter'>0{
				forvalues l = 1/`language_counter'{
					label language `_language`l''
					capture label list _var`i'_labels_`_language`l''
					if (_rc == 111) {
						di "{red: Warning: No Value Labels defined for Variable{it: `_varname`i''} for Language{it: `_language`l'' }.}"
					}
					if (_rc == 0) {
						label values `_varname`i'' _var`i'_labels_`_language`l''
					}
				}
			}
			else {
				label values `_varname`i'' _var`i'_labels
			}
			
		}
		
	}
	if `saveit'==1 {
		quietly: save `"`save'"', `replace'
	}
end
