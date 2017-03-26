function cu = calculate_cu(granulometry_table)
%CALCULATE_CC Calcula el coeficiente de uniformidad a partir de una tabla de
%granulometría retornada por create_granulometry_table.
%
%   CU = CALCULATE_CU(GRANULOMETRY_TABLE) retorna el valor de coeficiente
%   de uniformidad a partir de una tabla de granulometría.
%
%   granulometry_table: Tabla granulométrica resultante de
%   create_granulometry_table.

d10 = calculate_d(granulometry_table, 10);
d60 = calculate_d(granulometry_table, 60);

try
    cu = d60 / d10;
catch
    error('Error when calculating uniformity coefficient.');
end

end

