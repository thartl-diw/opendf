{smcl}
{* *! version 1.0.0  27feb2024}{...}
{vieweralsosee "opendf_read" "help opendf_read"}{...}
{vieweralsosee "opendf_write" "help opendf_write"}{...}
{vieweralsosee "opendf_docu" "help opendf_docu"}{...}
{vieweralsosee "csv2dta" "help csv2dta"}{...}
{viewerjumpto "Syntax" "dta2csv##syntax"}{...}
{viewerjumpto "Description" "dta2csv##description"}{...}
{viewerjumpto "Options" "dta2csv##options"}{...}
{viewerjumpto "Examples" "dta2csv##examples"}{...}
help for {cmd:dta2csv}{right:version 1.0 (13 Feb 2024)}
{hline}

dta2csv
{title:Title}

{phang}
{bf:dta2csv} {hline 2} builds csv files containing meta data for survey data from a stata dataset (.dta). {p_end}

{marker syntax}
{title:Syntax}
{p 8 17 2}
{cmd:dta2csv}
{cmd:}[, {languages()} {input()} {output_dir()}]

{synoptset 20 tabbed}{...}
{marker comopt}{synopthdr:options}
{synoptline}
{synopt :{opt languages(string)}}Specifies which label and description languages should be written to the csvs. (Default: "all") {p_end}
{synopt :{opt input(string)}}Specifies a .dta file that should be loaded and written to csvs. {p_end}
{synopt :{opth output_dir(string)}}Specifies a directory where to save the csvs. {p_end}
{synoptline}


{marker description}
{title:Description}

{pstd}
{cmd:dta2csv} Transforms survey data from dta-format including metadata saved in labels and characteristics to four csvs files (data.csv, dataset.csv, variables.csv and categories.csv) in the temp-folder. {p_end}
{pstd}{opt languages} Indicates which languages to keep. Default is "all". {p_end}
{pstd}{opt input} Indicates a .dta file that should be loaded and written to csv. Default is the dataset currently loaded in stata. {p_end}
{pstd}{opt output_dir} Indicates whether the csv files should additionally be saved in a specified folder. {p_end}
{pstd}data.csv containings the data. {p_end}
{pstd}dataset.csv contains the metadata of the dataset  {p_end}
{pstd}variables.csv contains the metadata of the variables.  {p_end}
{pstd}categories.csv contains the metadata of the values. {p_end}
{pstd} Metadata is taken from the labels and characteristics. {p_end}

{marker remarks}
{title:Remarks}

{pstd}
This command is part of the Data Open Format Project bundle, written to assist with survey data files in the open data format(.zip).{p_end}


{marker examples}
{title:Examples}

{phang}Saves the dataset that is currently loaded in 4 csvs in the current working directory (and in the temp-folder). {p_end}
{phang}{cmd:. dta2csv, output_dir(c(pwd))}{p_end}




{marker author}
{title:Author}

{pstd}
Tom Hartl ({browse "mailto:thartl@diw.de":hartl@diw.de}), Deutsches Institut für Wirtschaftsforschung Germany. 


{marker alsosee}
{title:Also see}

{psee}
{space 2}Help: {help opendf_read}, {help opendf_write}, {help opendf_docu}{p_end}
