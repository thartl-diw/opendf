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
	version 0.1
	syntax, input(string) [LANGUAGES(string) SAVE(string) REPLACE CLEAR]

    local languages "all"
	if (`"`languages'"' != "") {
		local languages `languages'
	}

    local input_zip="`input'"
    
    xml2csv , input_zip(`input_zip') languages(`languages')
    csv2dta, csv_loc($output_dir) save(`save') `replace' `clear'
end
