function indx = indx_fines_p(f)
%INDX_FINES_P Esta función retorna el índice para cada tipo de porcentaje de
%finos de la muestra.
%   INDX = INDX_FINES_P(F) retorna el índice asociado al porcentaje F de
%   finos, el porcentaje debe ser un número entero en el rango 0-100.

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

