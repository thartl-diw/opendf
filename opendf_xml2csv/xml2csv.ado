/*----------------------------------------------------------------------------------
  xml2csv.ado: builds csv files containing data and meta data from a zip-folder containing a data-csv and a meta data xml using python scripts
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
*! xml2csv.ado: loads data from csvs including meta data to build a stata dataset
*! version 1.0 March, 1st 2024 - initial release

program define xml2csv
    syntax, input_zip(string) languages(string)
	local input_zip = subinstr("`input_zip'", "\", "/", .)
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
    local _path_to_py_ado "subinstr("`_path_as_string'", "\", "/", .)"
    local _path_as_string: di `_path_to_py_ado'
    local _path_to_py_ado `_path_as_string'
    local linkToPy https://thartl-diw.github.io/opendf/xml2csv.py
    quietly: copy `linkToPy' `_path_to_new_py_file', replace
    
    python: import os
    python: from sfi import Macro
    python: Macro.setGlobal('output_dir', os.environ["TEMP"])
    python: exec_xml2csv(input_zip="`input_zip'", languages="`languages'")

end

python:

import sys
from sfi import Macro
sys.path.append(Macro.getLocal('_path_to_py_ado'))

import xml2csv
def exec_xml2csv(input_zip, languages):
    from sfi import Macro
    import os
    temp_dir = os.environ["TEMP"]
    input_zip = Macro.getLocal('input_zip')
    languages = Macro.getLocal('languages')
    xml2csv.make_csvs(input_zip, temp_dir, Macro.getLocal('languages'))
end
