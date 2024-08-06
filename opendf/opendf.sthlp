{smcl}
{* *! version 2.0.0 (05 August 2024)}{...}
{vieweralsosee "opendf read" "help opendf read"}{...}
{vieweralsosee "opendf write" "help opendf write"}{...}
{vieweralsosee "opendf docu" "help opendf docu"}{...}
{viewerjumpto "Syntax" "opendf##syntax"}{...}
{viewerjumpto "Description" "opendf##description"}{...}
{viewerjumpto "Remarks" "opendf##remarks"}{...}
help for {cmd:opendf}{right: version 2.0.0 (05 August 2024)}
{hline}


{marker syntax}{...}
{title:Syntax}

    Read data

{p 8 16 2}{cmd:opendf} {cmd:read} {it:input} [,{opt rowrange()} {opt colrange()} {opt clear} {opt save()} {opt replace} {opt verbose}]


    Write data

{p 8 16 2}{cmd:opendf} {cmd:write} {it:output} [,{opt input()} {opt languages()} {opt variables()} {opt verbose}]


    Display metadata of dataset or variable

{p 8 16 2}{cmd:opendf} {cmd:docu} [{it: varname}, {opt languages()}]


    Download a python version to work with Stata.

{p 8 16 2}{cmd:opendf} {cmd:installpython} [, {opt version()} {opt location()}]


    Delete a python version installed with opendf installpython.

{p 8 16 2}{cmd:opendf} {cmd:removepython} [, {opt version()} {opt location()}]

    
    Build a Stata dataset (.dta) with metadata from the opendf specification from csv files containing meta data for survey data.

{p 8 16 2}{cmd:opendf} {cmd:csv2dta} , {opt csv_loc()} [{opt rowrange}([start][:end]) {opt colrange}([start][:end])} {opt clear} {opt save()} {opt replace} {opt verbose}]


    Write data in open data format (.zip) from csv files containing meta data for survey data.

{p 8 16 2}{cmd:opendf} {cmd:csv2zip}, {opt output()} [{opt input()} {opt variables_arg()} {opt export_data()} {opt verbose}]


    Write four CSV-files with data and meta data from Stata ODF dataset.

{p 8 16 2}{cmd:opendf} {cmd:dta2csv}, {opt output_dir()} [{opt languages()} {opt input()}]


    Write four CSV-files with data and meta data from ODF zip-file.

{p 8 16 2}{cmd:opendf} {cmd:zip2csv}, {opt input_zip()} {opt output_dir()} {opt languages()} [{opt verbose}]


{marker description}{...}
{title:Description}

{pstd}
{cmd:opendf read} {hline 2} builds a Stata dataset (.dta) from open data format dataset (.zip) {p_end}
{pstd}
{cmd:opendf write} {hline 2} Saves data in the opendf-format as opendf-zip folder containing a csv(data) and a xml(metadate) file.{p_end}
{pstd}
{cmd:opendf docu} {hline 2} Display information about the dataset or a variable. {p_end}
{pstd}
{cmd:opendf installpython} {hline 2} Copies python to some directory on your computer. {p_end}
{pstd}
{cmd:opendf removepython} {hline 2} Removes python that was installed with opendf installpython. {p_end}
{pstd}
{cmd:opendf csv2dta} {hline 2} Build a Stata dataset (.dta) with metadata from the opendf specification from four csv files containing meta data for survey data. {p_end}
{pstd}
{cmd:opendf csv2zip} {hline 2}  Write data in open data format (.zip) from four csv files containing meta data for survey data. {p_end}
{pstd}
{cmd:opendf dta2csv} {hline 2} Write four CSV-files containing meta data for survey data from Stata ODF dataset. {p_end}
{pstd}
{cmd:opendf zip2csv} {hline 2}  Write four CSV-files containing meta data for survey data from ODF zip-file. {p_end}


{marker remarks}
{title:Remarks}

{pstd}The opendf commands in the opendf package from the Open Data Format Project are written to assist with survey data files in the open data format (ODF/.zip).{p_end}
{pstd} Due to cross-plattform compability of the Open Data Format some Stata-specific features are not supported by the ODF.{p_end}
{pstd}There are no value label names in the ODF. Therefore value label names are lost when a datset is written to ODF. Value labels reveice generic names when an ODF file is read in Stata.{p_end}
{pstd}For cross-plattform compability it is highly disrecommended to use and write extended missings for numeric variables (.a, .b, ..., .z) to an ODF file.{p_end}
{pstd}Extended missings are preserved in the datafile in ODF and will pose problems for other software platforms.{p_end}
{pstd}A numeric variable with extended missings will normally be treated as a character variable when the ODF file is read in other plattforms.{p_end}


{marker author}
{title:Author}

{pstd}
Tom Hartl ({browse "mailto:thartl@diw.de":thartl@diw.de}), Deutsches Institut für Wirtschaftsforschung Berlin. 


{marker alsosee}
{title:Also see}

{psee}
{space 2}Help: {help opendf read}, {help opendf write}, {help opendf docu}, {help opendf installpython}, {help opendf removepython} {help opendf csv2dta}, {help opendf csv2zip}, {help opendf dta2csv}, {help opendf zip2csv} {p_end}
