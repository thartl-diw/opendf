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

    getpythonscripts
    local _path_to_py_ado subinstr("`c(sysdir_plus)'py", "/", "\", .)
    local _path_to_py_ado: di `_path_to_py_ado'
    python: import os
    python: from sfi import Macro
    python: Macro.setGlobal('output_dir', os.environ["TEMP"])
    python: input_zip=Macro.setLocal('input_zip')
    python: languages=Macro.setLocal('languages')
    python: sys.path.append(Macro.getLocal('_path_to_py_ado'))
    python: import xml2csv
    python: import exec_xml2csv
    python: exec_xml2csv.exec_xml2csv(input_zip=input_zip, languages=languages)

end
