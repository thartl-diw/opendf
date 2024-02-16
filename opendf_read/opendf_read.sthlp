{smcl}
{* *! version 0.1.0  15feb2024}{...}
{vieweralsosee "xml2csv" "help xml2csv"}{...}
{vieweralsosee "" "--"}{...}
{viewerjumpto "Syntax" "opendf_read##syntax"}{...}
{viewerjumpto "Description" "opendf_read##description"}{...}
{viewerjumpto "Options" "opendf_read##options"}{...}
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
[{cmd:,} {opt clear} {opt save()} {opt replace}]

{synoptset 20 tabbed}{...}
{marker comopt}{synopthdr:options}
{synoptline}
{synopt :{opt clear}}allows you to clear dataset in memory {p_end}
{synopt :{opth save(string)}}save data to desired filepath and filename {p_end}
{synopt :{opt replace}}overwriting former saved file {p_end}
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

{phang}reshapes competency data from wide to long without saving data {browse "https://doi.org/10.5157/NEPS:SC4:12.0.0":doi:10.5157/NEPS:SC4:12.0.0}:{p_end}
{phang}{cmd:. comp2long "C:/NEPS/SC4/12-0-0/SC4_xTargetCompetencies_D_12-0-0.dta"}{p_end}

{phang}reshapes competency data from wide to long without saving data and clears existing dataset in memory {browse "https://doi.org/10.5157/NEPS:SC4:12.0.0":doi:10.5157/NEPS:SC4:12.0.0}:{p_end}
{phang}{cmd:. comp2long "C:/NEPS/SC4/12-0-0/SC4_xTargetCompetencies_D_12-0-0.dta", clear}{p_end}

{phang}reshapes competency data from wide to long, saving and replacing data {browse "https://doi.org/10.5157/NEPS:SC4:12.0.0":doi:10.5157/NEPS:SC4:12.0.0}:{p_end}
{phang}{cmd:. comp2long "C:/NEPS/SC4/12-0-0/SC4_xTargetCompetencies_D_12-0-0.dta", save("Y:/NEPS_workingdata/SC4/pTargetCompetencies.dta") replace} {p_end}

{phang}reshapes competency data from wide to long, saving and replacing data and harmonizes variable names of scored items {browse "https://doi.org/10.5157/NEPS:SC4:12.0.0":doi:10.5157/NEPS:SC4:12.0.0}:{p_end}
{phang}{cmd:. comp2long "C:/NEPS/SC4/12-0-0/SC4_xTargetCompetencies_D_12-0-0.dta", save("Y:/NEPS_workingdata/SC4/pTargetCompetencies.dta") replace harmonize} {p_end}

{phang}reshapes competency data from wide to long, saving and replacing data, harmonizes variable names of scored items and keeps only scored harmonized variables {browse "https://doi.org/10.5157/NEPS:SC4:12.0.0":doi:10.5157/NEPS:SC4:12.0.0}:{p_end}
{phang}{cmd:. comp2long "C:/NEPS/SC4/12-0-0/SC4_xTargetCompetencies_D_12-0-0.dta", save("Y:/NEPS_workingdata/SC4/pTargetCompetencies.dta") replace harmonize onlyharmonized} {p_end}


{marker limitations}
{title:Limitations}

{phang}use {bf:comp2long} {ul:{bf:before}} you use {bf:nepsmiss}, otherwise this tool will {bf:crash}!{p_end}
{phang}This syntax will crash if the same number of cases with wave_wX==0 occurs in two or more wave_wX-variables (e.g. wave_w1 and wave_w4 have equal numbers of non-participating individuals). This is VERY unlikely but yet possible!{p_end}

{pstd}
{bf: We cannot guarantee that it is usefull to treat all harmonized variables as longitudinal variables.}{p_end}


{marker author}
{title:Author}

{pstd}
Dietmar Angerer ({browse "mailto:dietmar.angerer@lifbi.de":dietmar.angerer@lifbi.de}), Leibniz Institute for Educational Trajectories, Germany. 


{marker alsosee}
{title:Also see}

{psee}
{space 2}Help: {help NEPStools}, {help merge}, {help append}{p_end}
