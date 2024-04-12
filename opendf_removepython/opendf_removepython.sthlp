{smcl}
{* *! version 0.1.0  27feb2024}{...}
{vieweralsosee "opendf read" "help opendf read"}{...}
{vieweralsosee "opendf write" "help opendf write"}{...}
{vieweralsosee "opendf docu" "help opendf docu"}{...}
{vieweralsosee "opendf installpython" "help opendf installpython"}{...}
{viewerjumpto "Syntax" "opendf installpython##syntax"}{...}
{viewerjumpto "Description" "opendf installpython##description"}{...}
{viewerjumpto "Examples" "opendf installpython##examples"}{...}
help for {cmd:opendf removepython (opendf_removepython)}{right:version 0.1 (15 Feb 2024)}
{hline}

opendf installpython
{title:Title}

{phang}
{bf:opendf removepython} {hline 2} Removes python folder(s) from the ado/plus folder or a specified folder. {p_end}


{marker syntax}
{title:Syntax}
{p 8 17 2}
{cmd:opendf removepython} 
[, {opt version()} {opt location()}]

{synoptset 20 tabbed}{...}
{marker comopt}{synopthdr:options}
{synoptline}
{synopt :{opt version(string)}} specifies a python version. eg. "3.12" {p_end}
{synopt :{opth location(string)}} specifies a path where to delete python {p_end}
{synoptline}


{marker description}
{title:Description}

{pstd}
{cmd:opendf removepython} Removes python folders from some directory on your computer. The command only works for Windows and does not require administrator privileges. But the user needs writing permission for the folder where python is saved. {p_end}
{pstd}
{opt version} Specifies the version of python to be removed. {p_end}
{pstd}
{opt location} Specifies the location where the python folder should be deleted. Default is the Stata ado/plus folder, where opendf installpython deploys python by defualt. {p_end}


{marker remarks}
{title:Remarks}

{pstd}
This command is part of the Data Open Format Project bundle, written to assist with survey data files in the open data format(.zip).{p_end}


{marker examples}
{title:Examples}

{phang}Instally python v3.12 (default) to the folder python3.12 in the do\plus folder{p_end}
{phang}{cmd:. opendf installpython}{p_end}

{phang} Deletes python v3.12 in the do\plus folder{p_end}
{phang}{cmd:. opendf removepython, version("3.12")}{p_end}

{phang} Deletes all folders which contain "python" in the name in C:\Program Files\python {p_end}
{phang}{cmd:. opendf installpython, location("C:\Program Files\python")} {p_end}

{phang} Deletes a folder "python3.12" in C:\Program Files\python if it exists {p_end}
{phang}{cmd:. opendf installpython, version("3.12") location("C:\Program Files\python")} {p_end}


{marker author}
{title:Author}

{pstd}
Tom Hartl ({browse "mailto:thartl@diw.de":thartl@diw.de}), Deutsches Institut für Wirtschaftsforschung Germany. 


{marker alsosee}
{title:Also see}

{psee}
{space 2}Help: {help opendf read}, {help opendf write}, {help opendf docu}, {help opendf removepython}{p_end}
