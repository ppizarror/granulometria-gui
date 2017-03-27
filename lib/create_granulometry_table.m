function table = create_granulometry_table(data)
% CREATE_GRANULOMETRY_TABLE Crea la tabla de granulometría a partir de los
% datos de la granulometría resultantes de la función
% load_granulometry_data.
%
%   TABLE=CREATE_GRANULOMETRY_TABLE(DATA) crea la tabla de granulometría a
%   partir de los datos granulométricos almacenados en la lista DATA.
%
%   data: Datos granulométricos resultantes de la función
%   load_granulometry_data.
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

if ischar(data)
    error('Data must be an cell object, please use load_granulometry_data return value as parameter.');
end

data_len = length(data);
table = cell(data_len, 1);

% Se crea la masa retenida total
total_mass = 0.0;
for i = 1:data_len
    try
        total_mass = total_mass + data{i}(3);
    catch
        error('Error when calculating total mass of granulometry data.');
    end
end

% Se completa la tabla
for i = 1:data_len
    table{i} = [data{i}(1), data{i}(2), data{i}(3), data{i}(3) * 100 / total_mass, 0, 0];
end

% Se crea el porcentaje de material acumulado y que pasa
table{1}(5) = table{1}(4);
table{1}(6) = 100 - table{1}(4);
for i = 2:data_len
    table{i}(5) = table{i-1}(5) + table{i}(4);
    table{i}(6) = table{i-1}(6) - table{i}(4);
end

end

