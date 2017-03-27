function plot_granulometry_table(granulometry_table, diameter_scale)
% PLOT_GRANULOMETRY_TABLE plotea el gráfico de la granulometría a partir de
% una tabla granulométrica retornada por create_granulometry_table.
%
%   granulometry_table: Tabla granulométrica resultante de
%   create_granulometry_table.
%   diameter_scale: Escala del eje x (eje del diámetro).
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

set(gcf, 'renderer', 'opengl')
lng = length(granulometry_table);
x = 1:lng - 1;
y = 1:lng - 1;

for i = 1:lng - 1
    x(i) = granulometry_table{i}(2);
    y(i) = granulometry_table{i}(6);
end

semilogx(x, y, '-s', 'color', [0.5, 0.5, 0.5], 'LineWidth', 2, 'MarkerFaceColor', [.5, .5, .5], 'MarkerSize', 5);
ylim([0, 100]);
grid
xlabel(['Tamaño de partícula [', diameter_scale, ']']);
ylabel('Porcentaje que pasa Pi [%]');
title('Curva granulométrica');

end

