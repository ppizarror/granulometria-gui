function c = get_gravel_group_symbol(pfines, cu, cc, fines)
%GET_GRAVEL_GROUP_SYMBOL Retorna el símbolo del grupo de la grava.
%   C = GET_GRAVEL_GROUP_SYMBOL(PFINES, CU, CC, FINES) retorna el símbolo
%   del grupo de la grava con PFINES porcentaje de finos, CU y CC valores
%   del coeficiente de uniformidad y coeficiente de forma respectivamente y
%   tipo de finos FINES.
%
%   PFINES: Número entre 0 y 100 [%].
%   CU: Número entre 0 y 100.
%   CC: Número entre 0 y 100.
%   FINES: String (ML, MH, CL-CH, CL-ML, CL-CH, CL-ML).
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
cucc = indx_cucc(cu, cc, 0);
tf = indx_fines_n(fines);
t_prop = [f, cucc, tf, -1, -1];

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
    if isequal_gs(t_prop, propr)
        indx = gravel_list{i, 1};
        indx = indx(4);
        c = symbol_group_indx(indx);
        return
    end
end

% Si no se encuentra se lanza error
error('Gravel classification (group symbol) does not exist');

end

