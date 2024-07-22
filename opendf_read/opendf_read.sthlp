{smcl}
{* *! version 1.0 (17 Apr 2024)}{...}
{vieweralsosee "opendf write" "help opendf write"}{...}
{vieweralsosee "opendf docu" "help opendf docu"}{...}
{viewerjumpto "Syntax" "opendf read##syntax"}{...}
{viewerjumpto "Description" "opendf read##description"}{...}
{viewerjumpto "Examples" "opendf read##examples"}{...}
help for  {cmd:opendf read (opendf_read)}{right:version 1.1 (22 July 2024)}
{hline}

opendf read
{title:Title}

{phang}
{bf:opendf read} {hline 2} builds a stata dataset (.dta) from open data format dataset (.zip) {p_end}


{marker syntax}
{title:Syntax}
{p 8 17 2}
{cmd:opendf read} {it: input} [,{opt rowrange}([start][:end]) {opt colrange}([start][:end]) {opt clear} {opt save()} {opt replace} {opt verbose}]

{synoptset 20 tabbed}{...}
{marker comopt}{synopthdr:options}
{synoptline}
{synopt :{opt rowrange}([start][:end])}Indicates the range of rows to read. {p_end}
{synopt :{opt colrange}([start][:end])}Indicates the range of columns to read. {p_end}
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
{opt "rowrange([start][:end])"} specifies a range of rows within the data to load (excluding the header). {it: start} and {it: end} are integer row numbers.

{pstd}
{opt "colrange([start][:end])"} specifies a range of variables within the data to load.  {it: start} and {it: end} are integer column numbers.

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
{phang}{cmd:. opendf read "https://thartl-diw.github.io/opendf/testdata.zip", clear save("testdata") replace verbose}{p_end}

{phang}Read the opendf-file testdata.zip from "https://thartl-diw.github.io/opendf/testdata.zip" into stata. The clear ensures, that the old dataset is removed from stata cache.{p_end}
{phang}{cmd:. opendf read "https://thartl-diw.github.io/opendf/testdata.zip", clear}{p_end}

{phang}Read the first 10 lines of the opendf-file testdata.zip from "https://thartl-diw.github.io/opendf/testdata.zip" into stata. Since the first line is also the header, the range has to be set to 11. {p_end}
{phang}{cmd:. opendf read "https://thartl-diw.github.io/opendf/testdata.zip", rowrange(:11}{p_end}

{marker author}
{title:Author}

{pstd}
Tom Hartl ({browse "mailto:thartl@diw.de":thartl@diw.de}), Deutsches Institut für Wirtschaftsforschung Germany. 


{marker alsosee}
{title:Also see}

{psee}
{space 2}Help: {help opendf write}, {help opendf docu}{p_end}
