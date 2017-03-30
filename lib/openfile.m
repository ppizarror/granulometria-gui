function openfile(handles, lang)
% OPEN FILE
% Abre un archivo excel de granulometría.
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
% Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.end

%% Se cargan las configuraciones
config;

%% Limpia el estado anterior
clear_status(handles, lang);

%% Carga el archivo
lastfolder = getappdata(handles.root, 'lasthandles_folder');
if ~strcmp(lastfolder, '') && ~isnumeric(lastfolder) && remember_last_folder
    [file, folder] = uigetfile({'*.xls;*.xslx', lang{2}}, lang{3}, lastfolder);
else
    [file, folder] = uigetfile({'*.xls;*.xlsx', lang{2}}, lang{3});
end
filename = strcat(folder, file);

%% Se guarda la última carpeta
setappdata(handles.root, 'lasthandles_folder', filename);

%% Se carga el archivo, si existe un error entonces se imprime mensaje
try
    tabla = load_granulometry_excel(filename);
catch
    disp_error(handles, 6, 5, lang);
    return
end

%% Se escribe el nombre del archivo cargado in-app
filename = filename(max(0, length(filename) - 38):end);
filename = strcat('...', filename);
filename = strcat(filename, ' ');
set(handles.filelabel, 'String', filename);

%% Se crea la tabla granulométrica
tabla = create_granulometry_table(tabla);
setappdata(handles.root, 'table', tabla);

%% Obtiene las propiedades
cmpsc = get_composition_list(tabla); % Composición [grava, arena, fino]
weight = get_total_weight(tabla); % Peso

d10 = calculate_d(tabla, 10);
d30 = calculate_d(tabla, 30);
d60 = calculate_d(tabla, 60);

cc = calculate_cc(tabla);
cu = calculate_cu(tabla);

%% Muestra las propiedades en la GUI
set(handles.info_peso_value, 'String', num2str(weight));
set(handles.info_grava_value, 'String', num2str(cmpsc(1)));
set(handles.info_arena_value, 'String', num2str(cmpsc(2)));
set(handles.info_fino_value, 'String', num2str(cmpsc(3)));
set(handles.info_cc_value, 'String', num2str(cc));
set(handles.info_cu_value, 'String', num2str(cu));
set(handles.info_d10_value, 'String', num2str(d10));
set(handles.info_d30_value, 'String', num2str(d30));
set(handles.info_d60_value, 'String', num2str(d60));

%% Establece el tipo de fino en el pop-up menu
if cmpsc(3) > 5
    set(handles.tipofino, 'String', {lang{19}, 'ML', 'MH', 'CL-CH', 'CL-ML', 'CL-CH', 'CL-ML'});
    set(handles.tipofino, 'Enable', 'on');
else
    setappdata(handles.root, 'fines', '');
    set_classification(handles);
end

%% Plotea la curva
axes(handles.grafico);
plot_granulometry_table(tabla, 'mm');

