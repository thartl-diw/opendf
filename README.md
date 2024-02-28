# opendataformat 

## Overview

The `opendataformat` package is specifically designed to facilitate the seamless utilization of the Open Data Format. 
It offers functionality to import data from the Open Data Format into a stata data frame, as well as export data from a stata data frame (.dta) to the Open Data Format. 
Additionally, you can easily access comprehensive information about the dataset and variables. 
This user-friendly approach ensures convenient exploration and utilization of dataset information within your preferred environment.

For more comprehensive insights into the Open Data Format specification, please visit: [Open Data Format Specification](https://git.soep.de/opendata/specification). 
This resource provides detailed documentation and profiles illustrating the storage locations of attributes within the Open Data Format, as well as within the native formats to which they will be converted.

Additionally, you will have access to a practical example of [real data in the Open Data Format](https://git.soep.de/opendata/open-data-package).

Learn more about the Open Data Format in R in `vignette("opendataformat")`.

## Installation

``` stata
* At this point you can install the development version from github:
net install opendf, from (https://thartl-diw.github.io/opendf/) replace


```

## Getting started

The opendataformat package consists of three main functions:

- `opendf_read` to read an Open Data Format file in R. This function takes an input parameter, which is the path to the Open Data Format ZIP file, and points to an R object for further processing.

- `opendf_docu` to explore the dataset information. You can set the whole dataset `opendf_docu` or an selected variable `opendf_docu variable` as input and you will get the metadata displayed in Stata. 

- `opendf_write` to write the stata data frame to an Open Data Format ZIP file. By specifying the dataframe input and providing the output directory path the function will generate a ZIP file containing the dataset as "data.csv" and "metadata.xml".

``` stata
* You can load a dataset in opendf-format with opendf_read by specifying the path to the zip-folder, (in this case, the testdataset from github):
opendf_read, input("https://thartl-diw.github.io/opendf/testdata.zip") clear verbose

```

## Additional Functions

The opendataformat package provides further functions that might be helpful:

- `opendf_installpython` will install a python version that enables the opendf-package to work. Some functions (`opendf_read` and `opendf_write`) need a working python version on your PC. If stata is not able to find a working python version, this command will copy a python (default v3.12) to the stata ado/plus folder (where stata packages are stored). You can also specify the python version you want to install and specify a location where the folder with the python version should be deployed. But than you have to tell stata manually where the python.exe is located using "set python_exec".

- `csv2dta` to read data from four csvs containing data and metadata into stata. 

- `csv2xml` to save data from four csvs containing data and metadata to a opendf-format (zip-folder containing data.csv and metadata.xml). The csvs consist of data.csv (raw data), dataset.csv (dataset metadata), varaibles.csv (variables metadata) and categories.csv (value labels for variables).



For data providers the csv2dta and csv2xml functions might be interesting to convert their data to the opendf format. 


### Multilingual Datasets

When working with a multilingual dataset, the `opendataformatr` package provides the option to specify the language you want to work with for the main functions: `read_opendf()`, `docu_opendf()`, `write_opendf()`
 
You can achieve this by using the `languages` argument and setting it to either 
`all` to include all languages, or by specifying the language code such as `de` for German or `en` for English. 
This allows you to easily select the desired language for your dataset operations.
The language codes are defined by the [ISO 639-1](https://de.wikipedia.org/wiki/Liste_der_ISO-639-1-Codes).


## Getting help

If you encounter a clear bug, please file a minimal reproducible example
on [gitlab](https://git.soep.de/opendata/stata-package/-/issues). 

