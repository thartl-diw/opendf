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

program define csv2xml
    syntax, output(string) input(string) variables_arg(string) export_data(string)
    local output_dir = subinstr("`output'", "\", "/", .)
    local input_dir = subinstr("`input'", "\", "/", .)
    local _path_to_py_ado subinstr("`c(sysdir_plus)'py", "/", "\", .)
    local _path_to_py_ado: di `_path_to_py_ado'
    
    python: import sys
    python: import os
    python: from sfi import Macro
    python: input_dir=Macro.getLocal('input_dir')
    python: output_dir=Macro.getLocal('output_dir')
    *python: csv2xml.export_data=Macro.getLocal('export_data')
    *python: csv2xml.variables_arg=Macro.getLocal('variables_arg')
    python: sys.path.append(Macro.getLocal('_path_to_py_ado'))
    python: import csv2xml
    python: import exec_csv2xml
    python: exec_csv2xml.exec_csv2xml(input_dir=input_dir, output_dir=output_dir)

end

