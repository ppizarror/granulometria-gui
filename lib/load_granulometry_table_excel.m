function table = load_granulometry_table_excel(excel_file)
%LOAD_GRANULOMETRY_TABLE_EXCEL Retorna una tabla cargada a partir de un
%archivo excel.
%   LIST = LOAD_GRANULOMETRY_TABLE_EXCEL(EXCEL_FILE) carga el archivo excel
%   y genera la tabla granulométrica.
%
%   excel_file: String con la ubicación del archivo excel a cargar.

table = create_granulometry_table(load_granulometry_excel(excel_file));

end