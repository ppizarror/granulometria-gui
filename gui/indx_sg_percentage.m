function indx = indx_sg_percentage(p, t)
%INDX_SG_PERCENTAGE Retorna el índice asociado a la cantidad de arena o
%grava presente en la muestra.
%   INDX = INDX_SG_PERCENTAGE(P, T) retorna el índice asociado a la cantidad
%   de arena o grava presente en la muestra, P debe estar entre 0 y 100. Si
%   T=1 el porcentaje medido es arena, si T=0 el porcentaje medido es
%   grava.

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

