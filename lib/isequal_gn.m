function b = isequal_gn(a, b)
% ISEQUAL_GN Comprueba si las listas de nombre de grupo a y b son
% idénticas.
%
%   B = ISEQUAL_GN(A,B) comprueba que las listas A y B de grupo sean
%   idénticas.
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

if a(1) == b(1)
    if a(2) == b(2)
        if a(3) == b(3)
            if a(5) == b(5)
                b = true;
                return
            end
        end
    end
end

b = false;

end

