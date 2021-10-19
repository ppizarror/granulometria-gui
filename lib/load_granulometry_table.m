function table = load_granulometry_table(file)
% LOAD_GRANULOMETRY_TABLE Retorna una tabla cargada a partir de un archivo.
%
%   LIST = LOAD_GRANULOMETRY_TABLE(FILE) carga el archivo file y retorna una
%   tabla granulom�trica.
%
%   file: String con la ubicaci�n del archivo a cargar.
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

table = create_granulometry_table(load_granulometry_data(file));

end

