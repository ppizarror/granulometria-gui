function list = groupname_creator(n)
% GROUPNAME_CREATOR Función que retorna una estructura tipo cell para
% almacenar los tipos de suelos.
%
%   LIST = GROUPNAME_CREATOR(N) crea una lista de tamaño N.
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

list = cell(n, 1);
for j = 1:n
    list{j} = cell(1, 2);
end

end

