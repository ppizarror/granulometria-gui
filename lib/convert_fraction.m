function v = convert_fraction(f)
%CONVERT_FRACTION Retorna el valor de una expresión del tipo 'a b/c' o 'a'
%utilizado en el nombre de las mallas.
%
%   V=CONVERT_FRACTION(F) retorna el valor de una expresión del tipo 'a
%   b/c' o 'a'.
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

