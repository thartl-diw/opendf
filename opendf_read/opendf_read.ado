/*----------------------------------------------------------------------------------
  opendf_read.ado: loads data from opendf format (zip) to Stata
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
*! opendf_read.ado: loads data from opendf format (zip) to Stata
*! version 2.0.0 - 08 August 2024 - SSC Release


			
program define opendf_read 
	version 16
	syntax anything [,LANGUAGES(string) ROWRange(string) COLRange(string) SAVE(string) REPLACE CLEAR VERBOSE]
	local input=`anything'
  	*If the data.zip is a web path, the data is downloaded to the temp-folder
	if strpos(`"`input'"', "http")>0 | strpos(`"`input'"', "www.")>0{
		local _tempdir "`c(tmpdir)'"
	  	local _path_to_data `"`_tempdir'data.zip"'
		quietly: copy `input' `_path_to_data', replace
		local input `_path_to_data'
	}
	*Add default extension if .zip is missing
	if strpos(`"`input'"', ".zip")==0{
		local input=`"`input'.zip"'
	}
	confirm file `"`input'"'
	if (`"`languages'"' != "") {
	  	local languages `languages'
	}
	else {
      		local languages "all"
    	}
    	local input_zip=`"`input'"'
    	local csv_temp = "`c(tmpdir)'"
    	capture opendf_zip2csv , input_zip(`input_zip') output_dir("`csv_temp'") languages(`languages') `verbose'
    	if (_rc != 0) {
		di as error "Error in reading `input'. There might be a problem in the ODF-File or with writing permissions in the Temp-Folder."
		if (`"`verbose'"' != "") {
			opendf_zip2csv , input_zip(`input_zip') output_dir("`csv_temp'") languages(`languages') `verbose'
		}
		exit _rc
	}
	opendf_csv2dta, csv_loc("`csv_temp'") rowrange(`rowrange') colrange(`colrange') save(`save') `replace' `clear' `verbose'
end

