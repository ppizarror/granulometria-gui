function group_name = get_classification_groupname(granulometry_table, fines)
%GET_CLASSIFICATION_GROUPNAME Retorna el nombre de grupo de un suelo en
%función de su tabla granulométrica retornada por
%create_granulometry_table.
%
%   GROUP_NAME=GET_CLASSIFICATION_GROUPNAME(GRANULOMETRY_TABLE, FINES) retorna el
%   nombre del grupo de un suelo el cual tiene una tabla granulométrica y
%   el tipo de los finos está definida en la variable FINES.

g_table = granulometry_table;

% Se obtiene el porcentaje de gravas, arenas y finos
g_composition = get_composition_list(g_table);
g_gravel = g_composition(1);
g_sand = g_composition(2);
g_fines = g_composition(3);

% Se obtiene Cc y Cu
if g_fines > 12
    cc = 0;
    cu = 0;
else
    cc = calculate_cc(g_table);
    cu = calculate_cu(g_table);
end

if g_gravel >= 50
    group_name = get_gravel_group_name(g_fines, cu, cc, fines, g_sand);
else
    group_name = get_sand_group_name(g_fines, cu, cc, fines, g_gravel);
end

end

