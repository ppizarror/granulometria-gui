function indx = indx_cucc(cu, cc, t)
%INDX_CUCC Esta función retorna el índice para los valores de Cu y Cc de la
%muestra.
%   INDX = INDX_CUCC(CU, CC, T) retorna el índice asociado a los valores del
%   coeficiente de forma (CU) y coeficiente de uniformidad (CC) En la muestra,
%   CU y CC deben ser números enteros entre 0 y 100. Si T=0 entonces se
%   comprueba para las gravas, si T=1 se comprueba para las arenas.

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

