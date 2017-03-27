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
%
% This program is free software; you can redistribute it and/or
% modify it under the terms of the GNU General Public License
% as published by the Free Software Foundation; either version 2
% of the License, or (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

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

