function generate_sand_groupname()
%GENERATE_GRAVEL_GROUPNAME Esta Función retorna una lista tipo cell la cual
%contiene todos los parámetros asociados a las arenas y su clasificación.
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

try
    % Se instancia la lista
    list = groupname_creator(22);
    
    % Se añaden los parámetros a la lista
    list{1, 1} = [0, 2, -1, 9, 0];
    list{1, 2} = 'Well-graded sand';
    
    list{2, 1} = [0, 2, -1, 9, 1];
    list{2, 2} = 'Well-graded sand with gravel';
    
    list{3, 1} = [0, 3, -1, 10, 0];
    list{3, 2} = 'Poorly graded sand';
    
    list{4, 1} = [0, 3, -1, 10, 1];
    list{4, 2} = 'Poorly graded sand with gravel';
    
    list{5, 1} = [1, 2, 0, 11, 0];
    list{5, 2} = 'Well-graded sand with silt';
    
    list{6, 1} = [1, 2, 0, 11, 1];
    list{6, 2} = 'Well-graded sand with silt and gravel';
    
    list{7, 1} = [1, 2, 1, 12, 0];
    list{7, 2} = 'Well-graded sand with clay';
    
    list{8, 1} = [1, 2, 1, 12, 1];
    list{8, 2} = 'Well-graded sand with clay and gravel';
    
    list{9, 1} = [1, 2, 2, 12, 0];
    list{9, 2} = 'Well-graded sand with silty clay';
    
    list{10, 1} = [1, 2, 2, 12, 1];
    list{10, 2} = 'Well-graded sand with silty clay and gravel';
    
    list{11, 1} = [1, 3, 0, 13, 0];
    list{11, 2} = 'Poorly graded sand with silt';
    
    list{12, 1} = [1, 3, 0, 13, 1];
    list{12, 2} = 'Poorly graded sand with silt and gravel';
    
    list{13, 1} = [1, 3, 1, 14, 0];
    list{13, 2} = 'Poorly graded sand with clay';
    
    list{14, 1} = [1, 3, 1, 14, 1];
    list{14, 2} = 'Poorly graded sand with clay and gravel';
    
    list{15, 1} = [1, 3, 2, 14, 0];
    list{15, 2} = 'Poorly graded sand with silty clay';
    
    list{16, 1} = [1, 3, 2, 14, 1];
    list{16, 2} = 'Poorly graded sand with silty clay and gravel';
    
    list{17, 1} = [2, -1, 0, 15, 0];
    list{17, 2} = 'Silty sand';
    
    list{18, 1} = [2, -1, 0, 15, 1];
    list{18, 2} = 'Silty sand with gravel';
    
    list{19, 1} = [2, -1, 3, 16, 0];
    list{19, 2} = 'Clayey sand';
    
    list{20, 1} = [2, -1, 3, 16, 1];
    list{20, 2} = 'Clayey sand with gravel';
    
    list{21, 1} = [2, -1, 2, 17, 0];
    list{21, 2} = 'Silty, clayey sand';
    
    list{22, 1} = [2, -1, 2, 17, 1];
    list{22, 2} = 'Silty, clayey sand with gravel';
    
    % Se guarda la lista
    save sand_groupname.mat list;
    
catch ME
    error('Error when generating sand group name.');
end
end