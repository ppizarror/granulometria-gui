function generate_gravel_groupname()
% GENERATE_GRAVEL_GROUPNAME Esta Función retorna una lista tipo cell la cual
% contiene todos los parámetros asociados a las gravas y su clasificación.
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
    list{1, 1} = [0, 0, -1, 0, 0];
    list{1, 2} = 'Well-graded gravel';
    
    list{2, 1} = [0, 0, -1, 0, 1];
    list{2, 2} = 'Well-graded gravel with sand';
    
    list{3, 1} = [0, 1, -1, 1, 0];
    list{3, 2} = 'Poorly graded gravel';
    
    list{4, 1} = [0, 1, -1, 1, 1];
    list{4, 2} = 'Poorly graded gravel with sand';
    
    list{5, 1} = [1, 0, 0, 2, 0];
    list{5, 2} = 'Well-graded gravel with silt';
    
    list{6, 1} = [1, 0, 0, 2, 1];
    list{6, 2} = 'Well-graded gravel with silt and sand';
    
    list{7, 1} = [1, 0, 1, 3, 0];
    list{7, 2} = 'Well-graded gravel with clay';
    
    list{8, 1} = [1, 0, 1, 3, 1];
    list{8, 2} = 'Well-graded gravel with clay and sand';
    
    list{9, 1} = [1, 0, 2, 3, 0];
    list{9, 2} = 'Well-graded gravel with silty clay';
    
    list{10, 1} = [1, 0, 2, 3, 1];
    list{10, 2} = 'Well-graded gravel with silty clay and sand';
    
    list{11, 1} = [1, 1, 0, 4, 0];
    list{11, 2} = 'Poorly graded gravel with silt';
    
    list{12, 1} = [1, 1, 0, 4, 1];
    list{12, 2} = 'Poorly graded gravel with silt and sand';
    
    list{13, 1} = [1, 1, 1, 5, 0];
    list{13, 2} = 'Poorly graded gravel with clay';
    
    list{14, 1} = [1, 1, 1, 5, 1];
    list{14, 2} = 'Poorly graded gravel with clay and sand';
    
    list{15, 1} = [1, 1, 2, 5, 0];
    list{15, 2} = 'Poorly graded gravel with silty clay';
    
    list{16, 1} = [1, 1, 2, 5, 1];
    list{16, 2} = 'Poorly graded gravel with silty clay and sand';
    
    list{17, 1} = [2, -1, 0, 6, 0];
    list{17, 2} = 'Silty gravel';
    
    list{18, 1} = [2, -1, 0, 6, 1];
    list{18, 2} = 'Silty gravel with sand';
    
    list{19, 1} = [2, -1, 3, 7, 0];
    list{19, 2} = 'Clayey gravel';
    
    list{20, 1} = [2, -1, 3, 7, 1];
    list{20, 2} = 'Clayey gravel with sand';
    
    list{21, 1} = [2, -1, 2, 8, 0];
    list{21, 2} = 'Silty, clayey gravel';
    
    list{22, 1} = [2, -1, 2, 8, 1];
    list{22, 2} = 'Silty, clayey gravel with sand';
    
    % Se guarda la lista
    save gravel_groupname.mat list;
    
catch ME
    error('Error when generating gravel group name.');
end
end

