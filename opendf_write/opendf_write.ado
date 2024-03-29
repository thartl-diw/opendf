/*----------------------------------------------------------------------------------
  opendf_write.ado: loads data from opendf format (zip) to stata
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
*! opendf_write.ado: saves a stata (.dta) dataset in the opendf format 
*! version 0.1 February, 22 2024 - first draft

program define opendf_write
  syntax anything [,input(string) languages(string) variables(varlist) REPLACE VERBOSE]
    local replaceit 0
    if (`"`replace'"' != "") local replaceit 1
    local output=`anything'
    if (strpos("`output'", ".zip") == 0) local output = "`output'.zip"
    capture confirm file "`output'"
    if (_rc == 0 & `replaceit'==0){
      di as error "file `output' already exists"
			exit 602
    }
    
    if (`"`languages'"' == "") {
	  	local languages "all"
	  }
    quietly: tempfile orig_dataset 
	  quietly: save `orig_dataset'
    if (`"`variables'"' != "" & `"`variables'"'!= "all") {
	  	    keep `variables'
	  }
    qui local output_folder= subinstr(`"`anything'"', ".zip", "", .)
	  qui local output_folder: di `output_folder'
    dta2csv, languages(`languages') input(`input') output_dir("`c(tmpdir)'")
    csv2xml, output(`"`output_folder'"') input("`c(tmpdir)'") variables_arg("yes") export_data("yes") `verbose'
    capture confirm file `"`output'"'
    if _rc == 0 {
      di "{text: Dataset successfully saved in opendf-format to {it:`output'}.}"
    }
    quietly: use `orig_dataset', clear
end

