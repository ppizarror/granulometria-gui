function print_cell_table(c)
%PRINT_CELL_TABLE Imprime en consola una estructura de datos tipo cell con
%listas.
%
%   c: Tabla a imprimir.

c_len = length(c);
for i = 1:c_len
    disp(c{i});
end

end

