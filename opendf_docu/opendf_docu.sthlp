{smcl}
{* *! version 0.1.0  27feb2024}{...}
{vieweralsosee "opendf_read" "help opendf_read"}{...}
{vieweralsosee "opendf_write" "help opendf_write"}{...}
{viewerjumpto "Syntax" "opendf_docu##syntax"}{...}
{viewerjumpto "Description" "opendf_docu##description"}{...}
{viewerjumpto "Examples" "opendf_docu##examples"}{...}
help for {cmd:opendf_docu}{right:version 0.1 (15 Feb 2024)}
{hline}

opendf_docu
{title:Title}

{phang}
{bf:opendf_docu} {hline 2} Display information about the dataset or a variable. {p_end}


{marker syntax}
{title:Syntax}
{p 8 17 2}
{cmd:opendf_docu}
[{it:{help varname}}]


{marker description}
{title:Description}

{pstd}
{cmd:opendf_docu} Displays information about the dataset or a variable, if a variable is specified. {p_end}

{marker remarks}
{title:Remarks}

{pstd}
This command is part of the Data Open Format Project bundle, written to assist with survey data files in the open data format(.zip).{p_end}


{marker examples}
{title:Examples}

{phang}Displays information about the dataset.{p_end}
{phang}{cmd:. opendf_docu}{p_end}

{phang}Displays information about the variable bap9001.{p_end}
{phang}{cmd:. opendf_docu bap9001}{p_end}


{marker author}
{title:Author}

{pstd}
Tom Hartl ({browse "mailto:thartl@diw.de":hartl@diw.de}), Deutsches Institut für Wirtschaftsforschung Germany. 


{marker alsosee}
{title:Also see}

{psee}
{space 2}Help: {help opendf_read}, {help opendf_write}{p_end}