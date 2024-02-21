/*----------------------------------------------------------------------------------
  opendf_docu.ado: loads data from opendf format (zip) to stata
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
*! opendf_docu.ado: displays metadata of variable or datasat
*! version 0.1 February, 20 2024 - first draft

program define opendf_docu
    *input arguments
    args input
    *get activated label language
    local _currentlanguage: char _dta[_lang_c]
    *if input is not empty, we assume that input is a variable
    if (`"`input'"' != "") {
        local _output = "variable"
        local _name = "`input'"
        capture local _label : variable label `input'
        if _rc==111 {
            display as error "variable `input' not found"
            display as error "Enter a valid variable name or execute the opendf_docu without an argument to display the dataset information."
            exit 111
        } 
        local _descr: char `input'[description_`_currentlanguage']
        if "`_descr'"=="" {
            local _descr: char `input'[description]
        }
        if "`_descr'"=="" {
            local mylanguage=strupper("`_currentlanguage'")
            local _descr: char `input'[description_`mylanguage']
        }
            if "`_descr'"=="" {
            local mylanguage=strlower("`_currentlanguage'")
            local _descr: char `input'[description_`mylanguage']
        }
        local _url: char `input'[url]
        local _type: char `input'[type]
    }
    else {
        local _output "dataset"
        local _name: char _dta[dataset]
        local _label : data label

        local _descr: char _dta[description_`_currentlanguage']
        if "`_descr'"=="" {
            local _descr: char _dta[description]
        }
        if "`_descr'"=="" {
            local mylanguage=strupper("`_currentlanguage'")
            local _descr: char _dta[description_`mylanguage']
        }
            if "`_descr'"=="" {
            local mylanguage=strlower("`_currentlanguage'")
            local _descr: char _dta[description_`mylanguage']
        }
        local _url: char _dta[url]
    }
    if "`_output'"=="variable" display "Variable: {p 20 20}`_name'{p_end}"
    if "`_output'"=="dataset" display "Dataset: {p 20 20}`_name'{p_end}"
    display "Label: {p 20 20}`_label'{p_end}"
    display "Description: {p 20 20}`_descr'{p_end}"
    display "URL: "
    display `"{p 20 20}{stata "view browse `_url'":`_url'}{p_end}"'
    if "`_output'"=="variable" display "Variable Type: {p 20 20}`_type'{p_end}"
    if "`_output'"=="variable"{
		capture local _lblname: value label `input'
		if "`_lblname'"!= "" {
			display "Value Labels:"
			quietly label list `_lblname'
			forvalues _val=`r(min)'/`r(max)'{
				quietly local _lbl: label `_lblname' `_val'
				if ("`_lbl'" != "`_val'") {
					display `"{p 20 20}`_val' :  `_lbl'{p_end}"'
				}
			}
		}
	}

end

