{smcl}
{* *! version 1.0.0  27feb2024}{...}
{vieweralsosee "opendf_read" "help opendf_read"}{...}
{vieweralsosee "opendf_write" "help opendf_write"}{...}
{vieweralsosee "opendf_docu" "help opendf_docu"}{...}
{vieweralsosee "csv2dta" "help csv2dta"}{...}
{viewerjumpto "Syntax" "csv2xml##syntax"}{...}
{viewerjumpto "Description" "csv2xml##description"}{...}
{viewerjumpto "Options" "csv2xml##options"}{...}
{viewerjumpto "Examples" "csv2xml##examples"}{...}
help for {cmd:csv2xml}{right:version 1.0 (13 Feb 2024)}
{hline}

csv2xml
{title:Title}

{phang}
{bf:csv2xml} {hline 2} generates an opendf-format zip-file from csv files containing data meta data for survey data. {p_end}


{marker syntax}
{title:Syntax}
{p 8 17 2}
{cmd:csv2xml}, 
{opt output()} {opt input()} [{opt variables_arg()} {opt export_data()} {opt verbose}]

{synoptset 20 tabbed}{...}
{marker comopt}{synopthdr:options}
{synoptline}
{synopt :{opt output(string)}}(Path and) Name of the output-zip-folder. {p_end}
{synopt :{opt input(string)}}Indicates location of csvs. {p_end}
{synopt :{opt variables_arg(string)}}Specifies which variables to keep. Default is "all". {p_end}
{synopt :{opt export_data(string)}}Indicates whether the data.csv should be exported to the opendf-zip file. Default is "yes".{p_end}
{synopt :{opt verbose}}More warnings are displayed. {p_end}
{synoptline}


{marker description}
{title:Description}

{pstd}
{cmd:csv2xml} Transforms survey data from several csv files into dta-format including metadata saved in labels and characteristics. {p_end}
{pstd}The file containing the data has to be named data.csv {p_end}
{pstd}The file containing the metadata for the datset has to be named dataset.csv {p_end}
{pstd}The file containing the metadata for the variables has to be named variables.csv {p_end}
{pstd}The file containing the metadata for the values has to be named categories.csv {p_end}

{pstd}{opt output} Name of the output-zip-folder. Can also include a path where to save the output. {p_end}
{pstd}{opt input} is a path to a folder where 4 csvs have to be included that contain data and metadata. {p_end}
{pstd}
{pstd} Option {opt variables_arg}} specifies which variables to keep. Default is "all". {p_end}
{{pstd} Option {opt export_data}} indicates whether the data.csv should be exported to the opendf-zip file. Default is "yes". To save a dataset in opendf-format "yes" is necessary. Otherwise only the xml with the metadata is created. {p_end}


{marker remarks}
{title:Remarks}

{pstd}
This command is part of the Data Open Format Project bundle, written to assist with survey data files in the open data format(.zip).{p_end}


{marker examples}
{title:Examples}

{phang}Builds and saves the datafile out.zip in the current working directory in opendf-format (.zip) from the four csvs located in "C:/Documents/Data". {p_end}
{phang}{cmd:. csv2xml, output("out") input("C:/Documents/Data")}{p_end}




{marker author}
{title:Author}

{pstd}
Tom Hartl ({browse "mailto:thartl@diw.de":hartl@diw.de}), Deutsches Institut für Wirtschaftsforschung Germany. 


{marker alsosee}
{title:Also see}

{psee}
{space 2}Help: {help opendf_read}, {help opendf_write}, {help opendf_docu}, {help csv2dta}{p_end}
