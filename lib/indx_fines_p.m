function indx = indx_fines_p(f)
% INDX_FINES_P Esta función retorna el índice para cada tipo de porcentaje de
% finos de la muestra.
%
%   INDX = INDX_FINES_P(F) retorna el índice asociado al porcentaje F de
%   finos, el porcentaje debe ser un número entero en el rango 0-100.
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

if f < 0
    error('Fines percentage must be greater or equal than zero.');
elseif (0 <= f) && (f < 5)
    indx = 0;
elseif (5 <= f) && (f <= 12)
    indx = 1;
elseif (12 < f) && (f <= 100)
    indx = 2;
else
    error('Fines percentage must be lower or equal than 100.');
end

end

