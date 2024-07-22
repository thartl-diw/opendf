{smcl}
{* *! version 1.0 (17 Apr 2024)}{...}
{vieweralsosee "opendf read" "help opendf read"}{...}
{vieweralsosee "opendf write" "help opendf write"}{...}
{vieweralsosee "opendf docu" "help opendf docu"}{...}
{viewerjumpto "Syntax" "opendf##syntax"}{...}
{viewerjumpto "Description" "opendf##description"}{...}
help for {cmd:opendf}{right:version 1.1 (22 July 2024)}
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

    
    Build a stata dataset (.dta) with metadata from the opendf specification from csv files containing meta data for survey data.

{p 8 16 2}{cmd:opendf} {cmd:csv2dta} [, {opt rowrange}([start][:end]) {opt colrange}([start][:end])} {opt clear} {opt save()} {opt replace} {opt verbose}]


    Write data in open data format (.zip) from csv files containing meta data for survey data.

{p 8 16 2}{cmd:opendf} {cmd:csv2zip} [, {opt input()} {opt variables_arg()} {opt export_data()} {opt verbose}]


{marker description}{...}
{title:Description}

{pstd}
{cmd:opendf read} {hline 2} builds a stata dataset (.dta) from open data format dataset (.zip) {p_end}
{pstd}
{cmd:opendf write} {hline 2} Saves data in the opendf-format as opendf-zip folder containing a csv(data) and a xml(metadate) file.{p_end}
{pstd}
{cmd:opendf docu} {hline 2} Display information about the dataset or a variable. {p_end}
{pstd}
{cmd:opendf installpython} {hline 2} Copies python to some directory on your computer. {p_end}
{pstd}
{cmd:opendf removepython} {hline 2} Removes python that was installed with opendf installpython. {p_end}
{pstd}
{cmd:opendf csv2dta} {hline 2} Build a stata dataset (.dta) with metadata from the opendf specification from four csv files containing meta data for survey data. {p_end}
{pstd}
{cmd:opendf csv2zip} {hline 2}  Write data in open data format (.zip) from four csv files containing meta data for survey data. {p_end}


{marker author}
{title:Author}

{pstd}
Tom Hartl ({browse "mailto:thartl@diw.de":thartl@diw.de}), Deutsches Institut für Wirtschaftsforschung Germany. 


{marker alsosee}
{title:Also see}

{psee}
{space 2}Help: {help opendf read}, {help opendf write}, {help opendf docu}, {help opendf installpython}, {help opendf removepython}{p_end}
