function cc = calculate_cc(granulometry_table)
% CALCULATE_CC Calcula el coeficiente de forma a partir de una tabla de
% granulometría retornada por create_granulometry_table.
%
%   CC = CALCULATE_CC(GRANULOMETRY_TABLE) retorna el valor de coeficiente
%   de forma a partir de una tabla de granulometría.
%
%   granulometry_table: Tabla granulométrica resultante de
%   create_granulometry_table.
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

d10 = calculate_d(granulometry_table, 10);
d30 = calculate_d(granulometry_table, 30);
d60 = calculate_d(granulometry_table, 60);

try
    cc = d30 * d30 / (d10 * d60);
catch
    error('Error when calculating curvature coefficient.');
end

end

