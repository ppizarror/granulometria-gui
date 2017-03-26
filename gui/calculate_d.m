function d = calculate_d(granulometry_table, n)
%CALCULATE_D Calcula el valor de D_n para una lista de granulometría.
%
%   D=CALCULATE_D(GRANULOMETRY_TABLE, N) calcula el valor característico
%   D_n para una tabla de granulometría GRANULOMETRY_TABLE retornada por la
%   función create_granulometry_table
%
%   granulometry_table: Tabla granulométrica resultante de
%   create_granulometry_table.
%   n: Pocentaje que pasa.

% Se recorre la tabla
j = -1;
for i = 1:length(granulometry_table) - 1
    if and(granulometry_table{i}(6) > n, granulometry_table{i+1}(6) < n)
        j = i;
    end
end
if j == -1
    error('Percentage %i doest exist in granulometry table.', n);
end

% Se crea la regresión lineal
try
    x = [granulometry_table{j}(2), granulometry_table{j+1}(2)];
    y = [granulometry_table{j}(6), granulometry_table{j+1}(6)];
    plft = polyfit(x, y, 1);
    d = (n - plft(2)) / plft(1);
catch
    error('Error when creating linear regression.');
end

end

