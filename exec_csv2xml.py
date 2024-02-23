def exec_csv2xml(input_dir, output_dir, ):
    from sfi import Macro
    import os
    import csv2xml
    temp_dir = os.environ["TEMP"]
    csv2xml.variables_arg = Macro.getLocal('variables_arg')
    csv2xml.export_data = Macro.getLocal('export_data')
    csv2xml.csv2xml(input_dir, output_dir)
end