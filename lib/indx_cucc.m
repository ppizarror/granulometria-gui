function indx = indx_cucc(cu, cc, t)
% INDX_CUCC Esta función retorna el índice para los valores de Cu y Cc de la
% muestra.
%
%   INDX = INDX_CUCC(CU, CC, T) retorna el índice asociado a los valores del
%   coeficiente de forma (CU) y coeficiente de uniformidad (CC) En la muestra,
%   CU y CC deben ser números enteros entre 0 y 100. Si T=0 entonces se
%   comprueba para las gravas, si T=1 se comprueba para las arenas.
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

if or(cc < 0, cu < 0) % Se comprueba que Cu y Cc sean válidos
    error('Cu and Cc should be greater than zero.');
elseif and(cu == 0, cc == 0)
    indx = -1;
    return
end

if t == 0 % Gravas
    if and(cu >= 4, and(1 <= cc, cc <= 3)) %#ok<*CHAIN>
        indx = 0;
    else
        indx = 1;
    end
elseif t == 1 % Arenas
    if and(cu >= 6, and(1 <= cc, cc <= 3)) %#ok<*CHAIN>
        indx = 2;
    else
        indx = 3;
    end
else % Tipo no válido
    error('Parameter t not valid, should be 0 or 1 for gravel and sand respectively.');
end


end

