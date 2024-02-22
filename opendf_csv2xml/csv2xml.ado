/*----------------------------------------------------------------------------------
  csv2xml.ado: builds opendf_zip-file containing data.csv and metadata.xml from 4 csvs

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
*! csv2xml.ado: builds opendf_zip-file containing data.csv and metadata.xml from 4 csvs
*! version 1.0 March, 1st 2024 - initial release

python:
import sys
from sfi import Macro
sys.path.append(Macro.getLocal('_path_to_py_ado'))
import csv2xml
def exec_csv2xml(input_dir, output_dir):
    from sfi import Macro
    import os
    temp_dir = os.environ["TEMP"]
    input_dir = Macro.getLocal('input_dir')
    output_dir = Macro.getLocal('output_dir')
    csv2xml.variables_arg = Macro.getLocal('variables_arg')
    csv2xml.export_data = Macro.getLocal('export_data')
    csv2xml.csv2xml(input_dir, output_dir)
end

program define csv2xml
    syntax, output(string) input(string) variables_arg(string) export_data(string)
    local output_dir = subinstr("`output'", "\", "/", .)
    local input_dir = subinstr("`input'", "\", "/", .)
    *import python file from package to stata
    *get location of ado files
    local plus_path c(sysdir_plus)
    *create folder for py scripts in ado-folder
    capture quietly mkdir "``plus_path''py"
    *create a string with the location of the folder for the py scripts and a string with the location including the name for the downloaded python script
    local _loc_py "``plus_path''py"
    local _loc_py "subinstr("`_loc_py'", "/", "\", .)"
    local _path_as_string: di `_loc_py'
    local _path_to_new_py_file "`_path_as_string'\csv2xml.py"
    *local _path_to_new_py_file2 "`_path_as_string'\csv_2_xml.py"
    local _path_to_py_ado "subinstr("`_path_as_string'", "\", "/", .)"
    local _path_as_string: di `_path_to_py_ado'
    local _path_to_py_ado `_path_as_string'
    local linkToPy https://thartl-diw.github.io/opendf/csv2xml.py
    quietly: copy `linkToPy' `_path_to_new_py_file', replace
    
    python: import os
    python: from sfi import Macro
    python: exec_csv2xml(input_dir="`input_dir'", output_dir="`output_dir'")

end

