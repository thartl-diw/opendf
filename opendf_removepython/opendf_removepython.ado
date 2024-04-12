/*----------------------------------------------------------------------------------
  opendf_installpython.ado: for windows users: Remove python folders from a specific location or by default from the ado/plus stata folder, where opendf installpython deploys the python by default
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
*! opendf_installpython.ado: for windows users: Remove python folders from a specific location or by default from the ado/plus stata folder, where opendf installpython deploys the python by default
*! version 0.1 February, 27 2024 - first draft

program opendf_removepython
	syntax, [VERSION(string) LOCATION(string)]
	quietly {
        if (`"`location'"' ==""){
                local location = c(sysdir_plus)
        }
        local subdirs : dir "C:\Users\User\ado\plus/" dirs "*"
        local python_version_found = "FALSE"
        foreach _dir in `subdirs'{
            if (strpos("`_dir'", "python`version'")>0){
                local python_version_found = "TRUE"
                shell rmdir "`location'`_dir'" /s /q
                noisily di "`_dir' deleted from `location'."
            }
        }
        if ("`python_version_found'"=="FALSE"){
            noisily: di "No python folder found."
        }
    }
	
end

