function b = isequal_gn(a, b)
%ISEQUAL_GN Comprueba si las listas de nombre de grupo a y b son idénticas
%   B = ISEQUAL_GN(A,B) comprueba que las listas A y B de grupo sean
%   idénticas.

if a(1) == b(1)
    if a(2) == b(2)
        if a(3) == b(3)
            if a(5) == b(5)
                b = true;
                return
            end
        end
    end
end

b = false;

end

