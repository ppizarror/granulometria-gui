function indx = indx_sg_percentage(p, t)
% INDX_SG_PERCENTAGE Retorna el índice asociado a la cantidad de arena o
% grava presente en la muestra.
%
%   INDX = INDX_SG_PERCENTAGE(P, T) retorna el índice asociado a la cantidad
%   de arena o grava presente en la muestra, P debe estar entre 0 y 100. Si
%   T=1 el porcentaje medido es arena, si T=0 el porcentaje medido es
%   grava.
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

if not(or(t == 0, t == 1))
    error('Parameter t not valid, should be 0 or 1 for gravel and sand respectively.');
end

if or(p < 0, p > 100)
    if t == 0
        error('Gravel percentage should be greater or equal than zero, and lower or equal than 100.');
    elseif t == 1
        error('Sand percentage should be greater or equal than zero, and lower or equal than 100.');
    end
else
    if p < 15
        indx = 0;
    else
        indx = 1;
    end
end

end

