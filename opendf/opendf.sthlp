{smcl}
{* *! version 0.1.0  27feb2024}{...}
{vieweralsosee "opendf read" "help opendf read"}{...}
{vieweralsosee "opendf write" "help opendf write"}{...}
{vieweralsosee "opendf docu" "help opendf docu"}{...}
{viewerjumpto "Syntax" "opendf installpython##syntax"}{...}
{viewerjumpto "Description" "opendf installpython##description"}{...}
help for {cmd:opendf}{right:version 0.1 (04 Mar 2024)}
{hline}


{marker syntax}{...}
{title:Syntax}

    Read data

{p 8 16 2}{cmd:opendf} {cmd:read}, {it: input()} [{opt clear} {opt save()} {opt replace} {opt verbose}]


    Write data

{p 8 16 2}{cmd:opendf} {cmd:write}, {it: output()} [{opt input()} {opt languages()} {opt variables()} {opt verbose}]


    Display metadata of dataset or variable

{p 8 16 2}{cmd:opendf} {cmd:docu} [{it: varname}]

    Download a python version to work with Stata.

{p 8 16 2}{cmd:opendf} {cmd:installpython} [, {opt version()} {opt location()}]



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


{marker author}
{title:Author}

{pstd}
Tom Hartl ({browse "mailto:thartl@diw.de":thartl@diw.de}), Deutsches Institut für Wirtschaftsforschung Germany. 


{marker alsosee}
{title:Also see}

{psee}
{space 2}Help: {help opendf read}, {help opendf write}, {help opendf docu} {help opendf installpython}{p_end}
