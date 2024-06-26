{smcl}
{* *! version 1.0 (17 Apr 2024)}{...}
{vieweralsosee "opendf read" "help opendf read"}{...}
{vieweralsosee "opendf write" "help opendf write"}{...}
{vieweralsosee "opendf docu" "help opendf docu"}{...}
{vieweralsosee "opendf removepython" "help opendf removepython"}{...}
{viewerjumpto "Syntax" "opendf installpython##syntax"}{...}
{viewerjumpto "Description" "opendf installpython##description"}{...}
{viewerjumpto "Examples" "opendf installpython##examples"}{...}
help for {cmd:opendf installpython (opendf_installpython)}{right:version 1.0 (17 Apr 2024)}
{hline}

opendf installpython
{title:Title}

{phang}
{bf:opendf installpython} {hline 2} Copies python to some directory on your computer. {p_end}


{marker syntax}
{title:Syntax}
{p 8 17 2}
{cmd:opendf installpython} 
[, {opt version()} {opt location()}]

{synoptset 20 tabbed}{...}
{marker comopt}{synopthdr:options}
{synoptline}
{synopt :{opt version(string)}} specifies a python version. eg. "3.12" {p_end}
{synopt :{opth location(string)}} specifies a path where to copy python to {p_end}
{synoptline}


{marker description}
{title:Description}

{pstd}
{cmd:opendf installpython} Copies python to some directory on your computer. The command only works for Windows and does not require administrator privileges. But the user needs writing permission for the folder where python is saved. {p_end}
{pstd}
{opt version} Specifies the version of python. It should be 2.7 or higher to function with stata. Default is 3.12. Python 3 is strongly recommended. {p_end}
{pstd}
{opt location} Specifies the location where the python folder will be copied to. If this option is set, the user has to manually indicate where python is located using set python_exec "path to exe.exe" at every start of Stata {p_end}


{marker remarks}
{title:Remarks}

{pstd}
This command is part of the Data Open Format Project bundle, written to assist with survey data files in the open data format(.zip).{p_end}


{marker examples}
{title:Examples}

{phang}Instally python v3.12 (default) to the folder python3.12 in the do\plus folder{p_end}
{phang}{cmd:. opendf installpython}{p_end}

{phang}Instally python v3.10  to the folder python3.12 in the do\plus folder{p_end}
{phang}{cmd:. opendf installpython, version("3.10")}{p_end}

{phang}rInstally python v3.10  to the folder C:\Program Files\python {p_end}
{phang}{cmd:. opendf installpython, version("3.10") location("C:\Program Files\python")} {p_end}


{marker author}
{title:Author}

{pstd}
Tom Hartl ({browse "mailto:thartl@diw.de":thartl@diw.de}), Deutsches Institut für Wirtschaftsforschung Germany. 


{marker alsosee}
{title:Also see}

{psee}
{space 2}Help: {help opendf read}, {help opendf write}, {help opendf docu}, {help opendf installpython}{p_end}
