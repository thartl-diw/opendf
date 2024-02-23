def exec_xml2csv(input_zip, languages):
    import os
    import xml2csv
    temp_dir = os.environ["TEMP"]
    xml2csv.make_csvs(input_zip, temp_dir, languages)