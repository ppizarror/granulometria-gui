function composition_list = get_composition_list(granulometry_table)
%GET_COMPOSITION_LIST Retorna la lista de composición de gravas, finos y
%arenas para una tabla granulométrica.
%
%   COMPOSITION_LIST=GET_COMPOSITION_LIST(GRANULOMETRY_TABLE) retorna la
%   lista de composición [gravas, arena, fino) a partir de una tabla de
%   granulometría retornada de la funcipón create_granulometry_table.
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

% Se importan las configuraciones
config;

% Se obtiene el total de gravas
try
    total_gravel = 0;
    for i = 1:length(granulometry_table) - 1
        if granulometry_table{i}(1) < granulometry_table{i+1}(1)
            decr = false;
        end
        if and(granulometry_table{i+1}(1) > 4, ~decr);
            break
        end
        total_gravel = total_gravel + granulometry_table{i}(4);
    end
catch
    disp('Error when calculating total gravel in granulometry table.');
end

% Se pobtiene el total de arenas
try
    total_f = 0;
    for i = 1:length(granulometry_table)
        if or(granulometry_table{i}(1) > 200, granulometry_table{i}(1) == 0)
            total_f = total_f + granulometry_table{i}(4);
        end
    end
catch
    error('Error when calculating total sand in granulometry table.');
end

% Se calcula el total de finos
total_sand = 100 - (total_f + total_gravel);

% Se retorna la lista
composition_list = [total_gravel, total_sand, total_f];

end

