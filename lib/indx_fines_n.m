function indx = indx_fines_n(n)
% INDX_FINES_N Esta función retorna el índice para cada nombre del fino
% presente en la muestra.
%
%   INDX = INDX_FINES_N(N) retorna el índice asociado al nombre del fino de
%   la muestra, N debe ser un string.
%
%   Tipos de finos: ML, MH, CL-CH, CL-ML, CL-CH, CL-ML. Si es vacío quiere
%   decir que el tipo de fino no es considerado dentro de la clasificación.
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

if not(ischar(n))
    error('Fine type must be an string, valid names: ML, MH, CL, CH, CL-CH or CL-ML.');
else
    n = upper(n);
    if strcmp(n, '')
        indx = -1;
    elseif or(strcmp(n, 'ML'), strcmp(n, 'MH'))
        indx = 0;
    elseif strcmp(n, 'CL-CH')
        indx = 1;
    elseif strcmp(n, 'CL-ML')
        indx = 2;
    elseif or(strcmp(n, 'CL'), strcmp(n, 'CH'))
        indx = 3;
    else
        error('Unrecognized fine type %s, valid names:  ML, MH, CL, CH, CL-CH or CL-ML.', n);
    end
end

end

