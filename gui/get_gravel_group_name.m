function c = get_gravel_group_name(pfines, cu, cc, fines, psand)
%GET_GRAVEL_GROUP_NAME Retorna el nombre de grupo de la grava.
%   C = GET_GRAVEL_GROUP_NAME(PFINES, CU, CC, FINES, PSAND)
%   retorna la clasificación de la grava con PFINES porcentaje de finos, CU
%   y CC valores del coeficiente de uniformidad y coeficiente de forma,
%   tipo de finos FINES y porcentaje de arena PSAND.
%
%   PFINES: Número entre 0 y 100 [%].
%   CU: Número entre 0 y 100.
%   CC: Número entre 0 y 100.
%   FINES: String (ML, MH, CL-CH, CL-ML, CL-CH, CL-ML).
%   PSAND: Número entre 0 y 100 [%].

% Se obtienen los índices según los parámetros de la clasificación
f = indx_fines_p(pfines);
cucc = indx_cucc(cu, cc, 0);
tf = indx_fines_n(fines);
ps = indx_sg_percentage(psand, 1);
t_prop = [f, cucc, tf, -1, ps];

% Se carga la lista de grupos para las gravas
try
    gravel_list = load('gravel_groupname.mat');
catch ME
    error('Gravel group does not exist, please execute the following command: generate_groupnames');
end
gravel_list = gravel_list.list;
gravel_list_size = length(gravel_list);

% Se busca el elemento en la lista
for i = 1:gravel_list_size
    propr = gravel_list{i, 1}; % Se obtienen las propiedades del grupo
    if isequal_gn(t_prop, propr)
        c = gravel_list{i, 2};
        return
    end
end

% Si no se encuentra se lanza error
error('Gravel classification (group name) does not exist');

end

