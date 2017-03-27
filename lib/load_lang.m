function langlist = load_lang(langid)
% LOAD LANG
% Carga las entradas de idioma.
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

%% Constantes
LANG_AVAIABLE_LANGUAGES = 2; % Español, English
LANG_ENTRIES = 70; % Entradas totales

%% Chequea si el lenguaje seleccionado es válido
if ~(1 <= langid && langid <= LANG_AVAIABLE_LANGUAGES)
    error('Invalid langid');
end

%% Crea listas de datos
list = cell(LANG_ENTRIES, 1);
for j = 1:LANG_ENTRIES
    list{j} = cell(1, LANG_AVAIABLE_LANGUAGES);
end

%% Se añaden los strings a las listas
list{1, 1} = '';
list{1, 2} = '';

list{2, 1} = '';
list{2, 2} = '';

list{3, 1} = '';
list{3, 2} = '';

list{4, 1} = '';
list{4, 2} = '';

list{5, 1} = '';
list{5, 2} = '';

list{6, 1} = '';
list{6, 2} = '';

list{7, 1} = '';
list{7, 2} = '';

list{8, 1} = '';
list{8, 2} = '';

list{9, 1} = '';
list{9, 2} = '';

list{10, 1} = '';
list{10, 2} = '';

list{11, 1} = '';
list{11, 2} = '';

list{12, 1} = '';
list{12, 2} = '';

list{13, 1} = '';
list{13, 2} = '';

list{14, 1} = '';
list{14, 2} = '';

list{15, 1} = '';
list{15, 2} = '';

list{16, 1} = '';
list{16, 2} = '';

list{17, 1} = '';
list{17, 2} = '';

list{18, 1} = '';
list{18, 2} = '';

list{19, 1} = '';
list{19, 2} = '';

list{20, 1} = '';
list{20, 2} = '';

list{21, 1} = '';
list{21, 2} = '';

list{22, 1} = '';
list{22, 2} = '';

list{23, 1} = '';
list{23, 2} = '';

list{24, 1} = '';
list{24, 2} = '';

list{25, 1} = '';
list{25, 2} = '';

list{26, 1} = '';
list{26, 2} = '';

list{27, 1} = '';
list{27, 2} = '';

list{28, 1} = '';
list{28, 2} = '';

list{29, 1} = '';
list{29, 2} = '';

list{30, 1} = '';
list{30, 2} = '';

list{31, 1} = '';
list{31, 2} = '';

list{32, 1} = '';
list{32, 2} = '';

list{33, 1} = '';
list{33, 2} = '';

list{34, 1} = '';
list{34, 2} = '';

list{35, 1} = '';
list{35, 2} = '';

list{36, 1} = '';
list{36, 2} = '';

list{37, 1} = '';
list{37, 2} = '';

list{38, 1} = '';
list{38, 2} = '';

list{39, 1} = '';
list{39, 2} = '';

list{40, 1} = '';
list{40, 2} = '';

list{41, 1} = '';
list{41, 2} = '';

list{42, 1} = '';
list{42, 2} = '';

list{43, 1} = '';
list{43, 2} = '';

list{44, 1} = '';
list{44, 2} = '';

list{45, 1} = '';
list{45, 2} = '';

list{46, 1} = '';
list{46, 2} = '';

list{47, 1} = '';
list{47, 2} = '';

list{48, 1} = '';
list{48, 2} = '';

list{49, 1} = '';
list{49, 2} = '';

list{50, 1} = '';
list{50, 2} = '';

list{51, 1} = '';
list{51, 2} = '';

list{52, 1} = '';
list{52, 2} = '';

list{53, 1} = '';
list{53, 2} = '';

list{54, 1} = '';
list{54, 2} = '';

list{55, 1} = '';
list{55, 2} = '';

list{56, 1} = '';
list{56, 2} = '';

list{57, 1} = '';
list{57, 2} = '';

list{58, 1} = '';
list{58, 2} = '';

list{59, 1} = '';
list{59, 2} = '';

list{60, 1} = '';
list{60, 2} = '';

list{61, 1} = '';
list{61, 2} = '';

list{62, 1} = '';
list{62, 2} = '';

list{63, 1} = '';
list{63, 2} = '';

list{64, 1} = '';
list{64, 2} = '';

list{65, 1} = '';
list{65, 2} = '';

list{66, 1} = '';
list{66, 2} = '';

list{67, 1} = '';
list{67, 2} = '';

list{68, 1} = '';
list{68, 2} = '';

list{69, 1} = '';
list{69, 2} = '';

list{70, 1} = '';
list{70, 2} = '';


%% Se selecciona la lista
langlist = cell(LANG_ENTRIES, 1);
for j = 1:LANG_ENTRIES
    langlist{j} = list{j, langid};
end

end

