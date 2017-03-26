function v = convert_fraction(f)
%CONVERT_FRACTION Retorna el valor de una expresión del tipo 'a b/c' o 'a'
%utilizado en el nombre de las mallas.
%
%   V=CONVERT_FRACTION(F) retorna el valor de una expresión del tipo 'a
%   b/c' o 'a'.

if not(ischar(f))
    error('Expected an string.');
else
    g = strsplit(f, ' ');
    switch length(g)
        case 0
            error('Expression not valid.');
        case 1
            if strcmp(g, '')
                v = 0;
            else
                g2 = strsplit(g{1}, '/');
                if length(g2) == 2
                    b = str2double(g2(1));
                    c = str2double(g2(2));
                    v = b / c;
                elseif length(g2) == 1
                    v = str2double(g);
                end
            end
        case 2
            a = g{1};
            g2 = strsplit(g{2}, '/');
            if length(g2) ~= 2
                error('Fraction %s in expression is not valid.', g(2));
            end
            a = str2double(a);
            b = str2double(g2(1));
            c = str2double(g2(2));
            v = a + b / c;
        otherwise
            error('Expression not valid.');
    end
end

if strcmp(num2str(v), 'NaN')
    error(f)
    error('Error when converting number from fraction expression.');
end

end

