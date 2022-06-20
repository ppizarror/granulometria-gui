function b = isequal_gs(a, b)
% ISEQUAL_GS Comprueba si las listas de grupo de s�mbolo a y b son
% id�nticas.
%
%   B = ISEQUAL_GS(A,B) comprueba que las listas A y B de grupo de s�mbolo
%   sean id�nticas.
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
            b = true;
            return
        end
    end
end

b = false;

end

