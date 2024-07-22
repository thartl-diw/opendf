{smcl}
{* *! version 1.0 (17 Apr 2024)}{...}
{vieweralsosee "opendf read" "help opendf read"}{...}
{vieweralsosee "opendf docu" "help opendf docu"}{...}
{viewerjumpto "Syntax" "opendf write##syntax"}{...}
{viewerjumpto "Description" "opendf write##description"}{...}
{viewerjumpto "Examples" "opendf write##examples"}{...}
help for {cmd:opendf write (opendf_write)}{right:version 1.1 (22 July 2024)}
{hline}

opendf write
{title:Title}

{phang}
{bf:opendf write} {hline 2} Saves data in the opendf-format as opendf-zip folder containing a csv(data) and a xml(metadate) file.{p_end}


{marker syntax}
{title:Syntax}
{p 8 17 2}
{cmd:opendf write} {it: output} [,{opt input()} {opt languages()} {opt variables()} {opt replace} {opt verbose}]

{synoptset 20 tabbed}{...}
{marker comopt}{synopthdr:options}
{synoptline}
{synopt :{opt output(string)}}(Path and) Name of the output-zip-folder. {p_end}
{synopt :{opt input(string)}}A path to a stata dataset which should be saved in opendf-format. {p_end}
{synopt :{opt languages(string)}}Chooses, which languages to keep. Default is all. {p_end}
{synopt :{opt variables(string)}}Chooses, which Variables to keep. Default is all. {p_end}
{synopt :{opt replace}}Overwrite the opendf file. {p_end}
{synopt :{opt verbose}}More warnings are displayed. {p_end}
{synoptline}

{marker description}
{title:Description}

{pstd}
{cmd:opendf write} Saves a dataset in the opendf-format (zip-folder). The Output is a zip-folder that contains a csv-file with the data and a xml-file with the meta data. {p_end}
{pstd}
{opt output} Name of the output-zip-folder. Can also include a path where to save the output. {p_end}
{pstd}
{opt input} A stata dataset (.dta) that should be saved in the opendf-format.{p_end}
{pstd}
{opt languages} The languages that should be saved in the opendf-file. Default is all.{p_end}
{pstd}
{opt variables} Indicates the variables that should be saved in the opendf-file. Default is all.{p_end}
{pstd}
{opt verbose} Indicates whether any existing file with this name should be overwritten.{p_end}
{opt verbose} If activated, more warnings are displayed.{p_end}


{marker remarks}
{title:Remarks}

{pstd}
This command is part of the Data Open Format Project bundle, written to assist with survey data files in the open data format(.zip).{p_end}


{marker examples}
{title:Examples}

{phang}Saves the dataset that is currently loaded in stata as zip-folder out.zip in the current working directory. {p_end}
{phang}{cmd:. opendf write "out"}{p_end}

{phang}Saves the dataset that is currently loaded in stata with the labels and descriptions in english as zip-folder out.zip in the current working directory.{p_end}
{phang}{cmd:. opendf write "out", languages("en")}{p_end}

{phang}Saves the variables pid, cid, hid, syear, name, bap9001 from the dataset that is currently loaded in stata with the labels and descriptions in english as zip-folder out.zip in the current working directory.{p_end}
{phang}{cmd:. opendf write "out", languages("en") variables(pid cid hid syear name bap9001)}{p_end}


{marker author}
{title:Author}

{pstd}
Tom Hartl ({browse "mailto:thartl@diw.de":thartl@diw.de}), Deutsches Institut für Wirtschaftsforschung Germany. 


{marker alsosee}
{title:Also see}

{psee}
{space 2}Help: {help opendf read}, {help opendf write}, {help opendf docu}{p_end}
