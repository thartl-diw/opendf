/*----------------------------------------------------------------------------------
  dta2csv.ado: builds csv files containing data and meta data from stata dataset (.dta)
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
*! dta2csv.ado: loads data from csvs including meta data to build a stata dataset
*! version 1.0 March, 1st 2024 - initial release

program define dta2csv
    syntax, [languages(string) input(string) output_dir(string)]
		if (`"`input'"' != "") {
			capture quietly use "`input'"
			di as error "Error: `input' is not a valid dataset. Insert the path to a valid dataset (.dta) or leave argument 'input' empty to use the dataset loaded in stata."
			exit 601
		}
	*Save dataset as data.csv
	quietly: export delimited "`c(tmpdir)'data",  nolabel replace
	if (`"`output_dir'"' != "") {
		quietly: export delimited "`output_dir'\data", replace
	}

	*save original data as tempfile
	quietly: tempfile datatempfile 
	quietly: save `datatempfile'

	if (`"`languages'"' == "") {
		local languages="all"
	}

	if ("`languages'" == "all") {
		local _languages: char _dta[_lang_list]
	}
	else {
		local _languages: `languages`
	}
	local dataset : char _dta[dataset]
	local url : char _dta[url]
	local label = ""
	if "`_languages'"=="default"{
		local label : data label
	}
	else {
		foreach l in `_languages'{
			if ("`l'"=="default"){
				di "{red: Warning: Label language default is not compatible to opendf-format. Labels and description without language tag might get lost when converting data to opendf-format.}
				quietly: local description_`l' : char _dta[description]
				quietly: label language `l'
				quietly: local label_`l' : data label
			}
			else {
				quietly: local description_`l' : char _dta[description_`l']
				quietly: label language `l'
				quietly: local label_`l' : data label
			}
		}
	}

	clear
	quietly {
		set obs 1
		gen dataset = "`dataset'"
		if "`_languages'"=="default"{
			gen label = "`label'"
			}
		else {
			foreach l in `_languages'{
				if "`l'"=="default"{
					if "`label_`l''"!="" gen label = "`label_`l''"
					if `"`description_`l''"'!= "" gen description = `"`description_`l''"'
				}
				else {
					if "`label_`l''"!="" gen label_`l' = "`label_`l''"
					if `"`description_`l''"'!= "" gen description_`l' = `"`description_`l''"'
				}
			}
		}
		gen url="`url'"
		foreach v of varlist _all{
				local _variable_type : type `v'
				if strpos("`_variable_type'", "str") == 1 {
					quietly: replace `v' = subinstr(`v', "'", char(34), .)
				}
			}

		order dataset label* description* url
	}
	*drop empty columns/characteristics (e.g. if description_en is available, but not desription, description is droped(since there is no information stored))
	foreach var of varlist * {
		qui count if missing(`var')
		if `=r(N)' == `c(N)' drop `var' 
	}
	*save dataset metadata as dataset.csv in working directory (temp folder)
	quietly: export delimited "`c(tmpdir)'/dataset", replace
	*if output_dir is specified, the csvs are additionally saved in the specified directory
	if (`"`output_dir'"' != "") {
		quietly: export delimited "`output_dir'\dataset", replace
	}

	*******   export variables meta data to variables.csv**************


	quietly {
		use `datatempfile', clear
		local _nvar "`c(k)'"
		clear
		*create empty dataframe with variables metadata with variables: variable, label, label_`languages', description, description_`l', url, type
		set obs `_nvar'
		gen variable=""
		foreach l in `_languages'{
			if ("`l'"=="default"){
				gen label=""
				gen description=""
			}
			else {
				gen label_`l'=""
				gen description_`l'=""
			}
		}
		gen url=""
		gen type=""
		order variable label* type description* url

		*save as temp file
		tempfile variablestempfile 
		save `variablestempfile'

		*Now for each variable save the metadata to the variables tempfile
		use `datatempfile', clear
		local _nvar_counter = 0
		foreach var of varlist _all {
			local _nvar_counter = `_nvar_counter'+1
			local variable = "`var'"
			local url : char `var'[url]
			local description : char `var'[description]
			local type : char `var'[type]
			local label = ""
			if "`_languages'"=="default"{
				local label : `var' label
			}
			else {
				foreach l in `_languages'{
					if "`l'"=="default"{
						local description : char `var'[description]
						label language `l'
						local label : data label
					}
					else {
						local description_`l' : char `var'[description_`l']
						label language `l'
						local label_`l' : data label
					}
					

				}
			}
			use `variablestempfile', clear
			replace variable in `_nvar_counter' = "`variable'"
			replace url in `_nvar_counter' = "`url'"
			replace description in `_nvar_counter' = "`description'"
			replace type in `_nvar_counter' = "`type'"
			
			if "`_languages'"=="default"{
				replace label in `_nvar_counter' = "`label'"
			}
			else {
				foreach l in `_languages'{
					if "`l'"=="default"{
						replace description in `_nvar_counter' = "`description_`l''"
						replace label in `_nvar_counter' = "`label_`l''"
					}
					else {
						replace description_`l' in `_nvar_counter' = "`description_`l''"
						replace label_`l' in `_nvar_counter' = "`label_`l''"
					}
				}
			}
			save `variablestempfile', replace
			use `datatempfile', clear
		}
		use `variablestempfile', clear

		*drop empty variables (e.g. if description_en is available, but not desription, description is droped(since there is no information stored))
		foreach var of varlist * {
			qui count if missing(`var')
			if `=r(N)' == `_nvar' drop `var' 
		}
	}
	*save variables metadata as variables.csv in working directory (temp folder)
	quietly: export delimited "`c(tmpdir)'variables", replace
	*if output_dir is specified, the csvs are additionally saved in the specified directory
	if (`"`output_dir'"' != "") {
		quietly: export delimited "`output_dir'\variables", replace
	}
	





	************     export variable labels to categories.csv    *****************

	quietly {
		*load dataset again
		use `datatempfile', clear
		*count how many value labels there are in total
		local _nvaluelabels=0
		qui label dir
		foreach _lbl in `r(names)' {
			label list `_lbl'
			local _nvaluelabels = `_nvaluelabels'+r(k)
			di r(k)
		}
		local _nvaluelabels = "`_nvaluelabels'"
		di "`_nvaluelabels'"
		clear
		
		*generate empty dataset for the variable labels
		set obs `_nvaluelabels'
		gen variable=""
		gen value=.
		if "`_languages'"!="default"{
			foreach l in `_languages'{
				if ("`l'"=="default"){
					gen label=""
				}
				else {
					gen label_`l'=""
				}
			}
		}

				
		tempfile categoriestempfile 
		save `categoriestempfile'

		use `datatempfile', clear
		local _row_categories_out = 0
		foreach var of varlist _all{
			local _nvaluelabel=0
			capture local _lblname: value label `var'
			*if a value label exist, execute following code
			if "`_lblname'"!= "" {
				quietly label list `_lblname'

				forvalues _val=`r(min)'/`r(max)'{
					local _lbl: label `_lblname' `_val'
					if ("`_lbl'" != "`_val'") {
						local _nvaluelabel = `_nvaluelabel' + 1
						local _val`_nvaluelabel'=`_val'
						foreach l in `_languages'{
							quietly label language `l'
							local _lbl_`l'`_nvaluelabel'="`_lbl'"
						}	
					}
				}
				use `categoriestempfile', clear
				forvalues i=1/`_nvaluelabel'{
					local _row_categories_out = `_row_categories_out' + 1
					replace variable in `_row_categories_out'="`var'"
					replace value in `_row_categories_out'=`_val`i''
					foreach l in `_languages'{
						if "`l'"=="default"{
							replace label in `_row_categories_out'="`_lbl_`l'`i''"
						}
						else {
							replace label_`l' in `_row_categories_out'="`_lbl_`l'`i''"
						}
					}
				}
				save `categoriestempfile', replace
				use `datatempfile', clear
			}
		}
		
			
	}
	quietly: use `categoriestempfile', clear 
	*drop empty rows
	quietly: drop if variable == ""
	*drop empty columns
	foreach var of varlist * {
			quietly: qui count if missing(`var')
			quietly: if `=r(N)' == `c(N)' drop `var' 
		}
	*save variables metadata as variables.csv in working directory (temp folder)
	quietly: export delimited "`c(tmpdir)'categories", replace
	*if output_dir is specified, the csvs are additionally saved in the specified directory
	if (`"`output_dir'"' != "") {
		quietly: export delimited "`output_dir'\categories", replace
	}
	quietly: use `datatempfile', clear
end
