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
	syntax [anything], [INPUT(string) OUTPUT(string) SAVE(string) LANGUAGES(string) VARIABLES(string) VERSION(string) LOCATION(string) REPLACE CLEAR VERBOSE]
	local _fun = `"`anything'"'
	tokenize `"`_fun'"'

	if ("`1'"=="read"){
		opendf_read `"`2'"', `clear' save("`save'") `replace' `verbose'
	}

	if ("`1'"=="write"){
		opendf_write `"`2'"', input("`input'") languages("`languages'") variables("`variables'") `replace' `verbose'
	}
	
	if ("`1'"=="installpython"){
		opendf_installpython, version("`version'") location("`location'")
	}

	if ("`1'"=="docu"){
		opendf_docu `"`2'"'
	}
end
