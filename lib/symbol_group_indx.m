function s = symbol_group_indx(indx)
%SYMBOL_GROUP_INDX retorna el nombre del símbolo del grupo.
%   S = SYMBOL_GROUP_INDX(INDX) retorna el string del símbolo del grupo
%   para un índice INDX.
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

switch indx
    case 0
        s = 'GW';
    case 1
        s = 'GP';
    case 2
        s = 'GW-GM';
    case 3
        s = 'GW-GC';
    case 4
        s = 'GP-GM';
    case 5
        s = 'GP-GC';
    case 6
        s = 'GM';
    case 7
        s = 'GC';
    case 8
        s = 'GC-GM';
    case 9
        s = 'SW';
    case 10
        s = 'SP';
    case 11
        s = 'SW-SM';
    case 12
        s = 'SW-SC';
    case 13
        s = 'SP-SM';
    case 14
        s = 'SP-SC';
    case 15
        s = 'SM';
    case 16
        s = 'SC';
    case 17
        s = 'SC-SM';
    otherwise
        error('Invalid symbol group index');
end

end

