/*----------------------------------------------------------------------------------
  opendf_read.ado: loads data from opendf format (zip) to stata
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
*! opendf_read.ado: loads data from opendf format (zip) to stata
*! version 0.1 February, 14 2024 - first draft

program define opendf_read
	syntax, input(string) [LANGUAGES(string) SAVE(string) REPLACE CLEAR]
    *If the data.zip is a web path, the data is downloaded to the temp-folder
    if strpos("`input'", "http")>0 | strpos("`input'", "www.")>0{
		local _tempdir "`c(tmpdir)'"
	    local _path_to_data `"`_tempdir'data.zip"'
	    quietly: copy `input' `_path_to_data', replace
        local input `_path_to_data'
    }
    local languages "all"
	if (`"`languages'"' != "") {
		local languages `languages'
	}

    local input_zip="`input'"
    
    xml2csv , input_zip(`input_zip') languages(`languages')
    csv2dta, csv_loc($output_dir) save(`save') `replace' `clear'
end
