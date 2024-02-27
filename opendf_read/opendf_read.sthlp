{smcl}
{* *! version 0.1.0  15feb2024}{...}
{vieweralsosee "opendf_write" "help opendf_write"}{...}
{vieweralsosee "opendf_docu" "help opendf_docu"}{...}
{viewerjumpto "Syntax" "opendf_read##syntax"}{...}
{viewerjumpto "Description" "opendf_read##description"}{...}
{viewerjumpto "Examples" "opendf_read##examples"}{...}
help for {cmd:opendf_read}{right:version 0.1 (15 Feb 2024)}
{hline}

opendf_read
{title:Title}

{phang}
{bf:opendf_read} {hline 2} builds a stata dataset (.dta) from open data format dataset (.zip) {p_end}


{marker syntax}
{title:Syntax}
{p 8 17 2}
{cmd:opendf_read} 
{it: input}
[{cmd:,} {opt clear} {opt save()} {opt replace} {opt verbose}]

{synoptset 20 tabbed}{...}
{marker comopt}{synopthdr:options}
{synoptline}
{synopt :{opt clear}}allows you to clear dataset in memory {p_end}
{synopt :{opth save(string)}}save data to desired filepath and filename {p_end}
{synopt :{opt replace}}overwriting former saved file {p_end}
{synopt :{opt verbose}}More warnings are displayed. {p_end}
{synoptline}


{marker description}
{title:Description}

{pstd}
{cmd:csv2dta} Loads data froam opendf format (zip-folder) into stata including metadata saved in labels and characteristics. {p_end}

{pstd}
The dataset is stored in the format of the original dataset. Metadata is saved as labels or in the characteristics. {p_end}

{pstd}
{opt input} path to zip file or name of zip file in working directory.

{pstd}
{opt clear} specifies that it is okay to replace the data in memory, even though the current data have not been saved to disk.{p_end}

{pstd}
{opt replace} overwrite existing reshaped competency dataset.{break}
If option {opt replace} is specified, a former saved file will be overwritten.
{p_end}

{pstd}
{opt save} stores data to a desired filepath and filename.{break}
If option {opt replace} is specified, a former saved file will be overwritten.
{p_end}

{marker remarks}
{title:Remarks}

{pstd}
This command is part of the Data Open Format Project bundle, written to assist with survey data files in the open data format(.zip).{p_end}


{marker examples}
{title:Examples}

{phang}Read the opendf-file testdata.zip from "https://thartl-diw.github.io/opendf/testdata.zip" into stata. The clear ensures, that the old dataset is removed from stata cache.{p_end}
{phang}With the save()-option the dataset is saved as testdata.dta in the working directory. If it already exists, it testdata.dta is replaced, verbose option is set on.{p_end}
{phang}{cmd:. opendf_read, input("https://thartl-diw.github.io/opendf/testdata.zip") clear save("testdata") replace verbose}{p_end}

{phang}Read the opendf-file testdata.zip from "https://thartl-diw.github.io/opendf/testdata.zip" into stata. The clear ensures, that the old dataset is removed from stata cache.{p_end}
{phang}{cmd:. opendf_read, input("https://thartl-diw.github.io/opendf/testdata.zip") clear}{p_end}


{marker author}
{title:Author}

{pstd}
Tom Hartl ({browse "mailto:thartl@diw.de":hartl@diw.de}), Deutsches Institut für Wirtschaftsforschung Germany. 


{marker alsosee}
{title:Also see}

{psee}
{space 2}Help: {help opendf_write}, {help opendf_docu}{p_end}
