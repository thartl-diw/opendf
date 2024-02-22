/*----------------------------------------------------------------------------------
  opendf_write.ado: loads data from opendf format (zip) to stata
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
*! opendf_write.ado: saves a stata (.dta) dataset in the opendf format 
*! version 0.1 February, 22 2024 - first draft

program define opendf_write
	syntax, output(string) [input(string) languages(string) variables(string) export_data(string)]

	if (`"`languages'"' == "") {
		local languages "all"
	}
    if (`"`variables'"' == "") {
		local variables "yes"
	}
    if (`"`export_data'"' == "") {
		local export_data "yes"
	}
    dta2csv, languages(`languages') input(`input')
    csv2xml, output(`output') input("`c(tmpdir)'") variables_arg(`variables') export_data(`export_data')
end

