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
*! version 1.0 April, 17 2024 - Pre-Release

program define opendf_write
  syntax anything [,input(string) languages(string) variables(varlist) REPLACE VERBOSE]
    preserve
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
    if (`"`input'"' != "") {
      capture quietly use "`input'"
      if _rc==601{
        di as error "Error: `input' is not a valid stata dataset (.dta). Insert the path to a valid dataset (.dta) or leave argument 'input' empty to use the dataset loaded in stata."
        exit 601
      }
    }
    if (`"`variables'"' != "" & `"`variables'"'!= "all") {
	  	    keep `variables'
	  }
    qui local output_folder= subinstr(`"`anything'"', ".zip", "", .)
	  qui local output_folder: di `output_folder'
    
    local wd: pwd
    if (strpos("`output_folder'", "\")==0 & strpos("`output_folder'", "/")==0){
      local output_folder= "`wd'/`output_folder'"
    }
    
    dta2csv, languages(`languages') input(`input') output_dir("`c(tmpdir)'")
    opendf csv2zip, output(`"`output_folder'"') input("`c(tmpdir)'") variables_arg("yes") export_data("yes") `verbose'
    capture confirm file `"`output'"'
    if _rc == 0 {
      di "{text: Dataset successfully saved in opendf-format to {it:`output'}.}"
    }
end
