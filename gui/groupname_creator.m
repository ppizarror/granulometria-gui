function list = groupname_creator(n)
%GROUPNAME_CREATOR Función que retorna una estructura tipo cell para
%almacenar los tipos de suelos.
%   LIST = GROUPNAME_CREATOR(N) crea una lista de tamaño N.

list = cell(n, 1);
for j = 1:n
    list{j} = cell(1, 2);
end

end

