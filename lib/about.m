function about(lang)
% ABOUT
% Muestra el acerca de.
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

%% Importa la versión
app_version;

%% Muestra mensaje
msgbox({'Granulometría'; lang{33}; ''; lang{28}; lang{29}; lang{32}; ''; ...
    sprintf(lang{31}, VERSION); lang{30}}, lang{27}, 'help');

end

