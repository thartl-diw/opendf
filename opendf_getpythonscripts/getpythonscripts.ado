/*----------------------------------------------------------------------------------
  getpythonscripts.ado: Downloads python scripts from the package to the ado folder
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
*! getpythonscripts.ado: Downloads python scripts from the package to the ado folder
*! version 1.0 March, 1st 2024 - initial release

program define getpythonscripts
    *import python file from package to stata
    *get location of ado files
    local plus_path c(sysdir_plus)
    *create folder for py scripts in ado-folder
    capture mkdir "``plus_path''py"
    *create a string with the location of the folder for the py scripts and a string with the location including the name for the downloaded python script
    local _loc_py "``plus_path''py"
    local _loc_py "subinstr("`_loc_py'", "/", "\", .)"
    local _path_as_string: di `_loc_py'
    local _path_to_new_py_file "`_path_as_string'\xml2csv.py"
    local linkToPy https://thartl-diw.github.io/opendf/python/xml2csv.py
    quietly: copy `linkToPy' `_path_to_new_py_file', replace

    local _path_to_new_py_file "`_path_as_string'\csv2xml.py"
    local linkToPy https://thartl-diw.github.io/opendf/python/csv2xml.py
    quietly: copy `linkToPy' `_path_to_new_py_file', replace
    local _path_to_new_py_file "`_path_as_string'\exec_xml2csv.py"
    local linkToPy https://thartl-diw.github.io/opendf/python/exec_xml2csv.py
    quietly: copy `linkToPy' `_path_to_new_py_file', replace
end

