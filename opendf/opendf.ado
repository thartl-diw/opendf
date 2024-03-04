/*----------------------------------------------------------------------------------
  opendf.ado: functions to work with data in opendf format (zip)
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
*! opendf.ado: provides programs to work with opendf data format
*! version 0.1 February, 22 2024 - first draft

program define opendf, rclass 
	syntax [anything], [INPUT(string) OUTPUT(string) SAVE(string) LANGUAGES(string) VARIABLES(string) REPLACE CLEAR VERBOSE]
	local _fun = lower("`anything'")

	if ("`_fun'"=="read"){
		opendf_read, input("`input'") `clear' save("`save'") `replace' `verbose'
	}

	if ("`_fun'"=="write"){
		opendf_write,  output("`output'") input("`input'") languages("`languages'") variables("`variables'") `verbose'
	}
	
	if ("`_fun'"=="install_python"){
		opendf_installpython, version("`version'") location("`location'")
	}

	tokenize "`_fun'"
	if ("`1'"=="docu"){
		opendf_docu "`2'"
	}
end
