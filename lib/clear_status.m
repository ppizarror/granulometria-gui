function clear_status(handles, lang) %#ok<*INUSD>
% DISP ERROR
% Limpia el estado de ejecución del programa
%
% Author: Pablo Pizarro @ppizarror.com, 2017.
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

%% Elimina el string del archivo cargado
set(handles.filelabel, 'String', '');

%% Elimina las propiedades
set(handles.info_peso_value, 'String', '');
set(handles.info_grava_value, 'String', '');
set(handles.info_arena_value, 'String', '');
set(handles.info_fino_value, 'String', '');
set(handles.info_cc_value, 'String', '');
set(handles.info_cu_value, 'String', '');
set(handles.info_d10_value, 'String', '');
set(handles.info_d30_value, 'String', '');
set(handles.info_d60_value, 'String', '');
set(handles.info_simbologrupo_value, 'String', '');
set(handles.info_nombregrupo_value, 'String', '');

%% Borra el selector
set(handles.tipofino, 'String', {''});
set(handles.tipofino, 'Enable', 'off');

end

