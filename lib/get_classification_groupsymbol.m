function group_symbol = get_classification_groupsymbol(granulometry_table, fines)
% GET_CLASSIFICATION_GROUPSYMBOL Retorna el símbolo del grupo de un suelo en
% función de su tabla granulométrica retornada por create_granulometry_table.
%
%   GROUP_SYMBOL=GET_CLASSIFICATION_GROUPSUMBOL(GRANULOMETRY_TABLE, FINES)
%   retorna el símbolo de grupo de un suelo el cual tiene una tabla
%   granulométrica y el tipo de los finos está definida en la variable FINES.
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

g_table = granulometry_table;

%% Se obtiene el porcentaje de gravas, arenas y finos
g_composition = get_composition_list(g_table);
g_gravel = g_composition(1);
g_fines = g_composition(3);

%% Se obtiene Cc y Cu
if g_fines > 12
    cc = 0;
    cu = 0;
else
    cc = calculate_cc(g_table);
    cu = calculate_cu(g_table);
end

%% Se clasifica según tipo de suelo
if g_gravel >= 50
    group_symbol = get_gravel_group_symbol(g_fines, cu, cc, fines);
else
    group_symbol = get_sand_group_symbol(g_fines, cu, cc, fines);
end

end

