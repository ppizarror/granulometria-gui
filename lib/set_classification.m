function set_classification(handles)
% SET CLASSIFICATION
% Establece la clasificación de suelos gruesos
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

%% Obtiene las variables
fines = getappdata(handles.root, 'fines');
table = getappdata(handles.root, 'table');

%% Obtiene clasificación
symbol = get_classification_groupsymbol(table, fines);
name = get_classification_groupname(table, fines);

%% Establece la clasificación
set(handles.info_simbologrupo_value, 'String', symbol);
set(handles.info_nombregrupo_value, 'String', name);

end

