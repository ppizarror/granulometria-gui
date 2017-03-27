function c = get_sand_group_name(pfines, cu, cc, fines, pgravel)
% GET_SAND_GROUP_NAME Retorna la clasificación de la arena.
%
%   C = GET_SAND_GROUP_NAME(PFINES, CU, CC, FINES, PSAND)
%   retorna el nombre del grupo de la arena con PFINES porcentaje de finos, CU
%   y CC valores del coeficiente de uniformidad y coeficiente de forma
%   respectivamente, tipo de finos FINES y porcentaje de grava PGRAVEL.
%
%   PFINES: Número entre 0 y 100 [%].
%   CU: Número entre 0 y 100.
%   CC: Número entre 0 y 100.
%   FINES: String (ML, MH, CL-CH, CL-ML, CL-CH, CL-ML).
%   PGRAVEL: Número entre 0 y 100 [%].
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

% Se obtienen los índices según los parámetros de la clasificación
f = indx_fines_p(pfines);
cucc = indx_cucc(cu, cc, 1);
tf = indx_fines_n(fines);
ps = indx_sg_percentage(pgravel, 0);
t_prop = [f, cucc, tf, -1, ps];

% Se carga la lista de grupos para las gravas
try
    sand_list = load('sand_groupname.mat');
catch ME
    error('Sand group name does not exist, please execute the following command: generate_groupnames');
end
sand_list = sand_list.list;
sand_list_size = length(sand_list);

% Se busca el elemento en la lista
for i = 1:sand_list_size
    propr = sand_list{i, 1}; % Se obtienen las propiedades del grupo
    if isequal_gn(t_prop, propr)
        c = sand_list{i, 2};
        return
    end
end

% Si no se encuentra se lanza error
error('Sand classification (group name) does not exist');

end

