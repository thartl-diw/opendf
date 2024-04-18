{smcl}
{* *! version 1.0 (17 Apr 2024)}{...}
{vieweralsosee "opendf read" "help opendf read"}{...}
{vieweralsosee "opendf write" "help opendf write"}{...}
{viewerjumpto "Syntax" "opendf docu##syntax"}{...}
{viewerjumpto "Description" "opendf docu##description"}{...}
{viewerjumpto "Examples" "opendf docu##examples"}{...}
help for {cmd:opendf docu (opendf_docu)}{right:version 1.0 (17 Apr 2024)}
{hline}

opendf docu
{title:Title}

{phang}
{bf:opendf docu} {hline 2} Display information about the dataset or a variable. {p_end}


{marker syntax}
{title:Syntax}
{p 8 17 2}
{cmd:opendf docu}
[{it:{help varname}}]


{marker description}
{title:Description}

{pstd}
{cmd:opendf docu} Displays information about the dataset or a variable, if a variable is specified. {p_end}

{marker remarks}
{title:Remarks}

{pstd}
This command is part of the Data Open Format Project bundle, written to assist with survey data files in the open data format(.zip).{p_end}


{marker examples}
{title:Examples}

{phang}Displays information about the dataset.{p_end}
{phang}{cmd:. opendf docu}{p_end}

{phang}Displays information about the variable bap9001.{p_end}
{phang}{cmd:. opendf docu bap9001}{p_end}


{marker author}
{title:Author}

{pstd}
Tom Hartl ({browse "mailto:thartl@diw.de":thartl@diw.de}), Deutsches Institut für Wirtschaftsforschung Germany. 


{marker alsosee}
{title:Also see}

{psee}
{space 2}Help: {help opendf read}, {help opendf write}{p_end}
