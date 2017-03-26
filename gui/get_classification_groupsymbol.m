function group_symbol = get_classification_groupsymbol(granulometry_table, fines)
%GET_CLASSIFICATION_GROUPSYMBOL Retorna el símbolo del grupo de un suelo en
%función de su tabla granulométrica retornada por create_granulometry_table.
%
%   GROUP_SYMBOL=GET_CLASSIFICATION_GROUPSUMBOL(GRANULOMETRY_TABLE, FINES)
%   retorna el símbolo de grupo de un suelo el cual tiene una tabla
%   granulométrica y el tipo de los finos está definida en la variable FINES.

g_table = granulometry_table;

% Se obtiene el porcentaje de gravas, arenas y finos
g_composition = get_composition_list(g_table);
g_gravel = g_composition(1);
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
    group_symbol = get_gravel_group_symbol(g_fines, cu, cc, fines);
else
    group_symbol = get_sand_group_symbol(g_fines, cu, cc, fines);
end

end

