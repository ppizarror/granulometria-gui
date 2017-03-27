function list = load_granulometry_data(file)
% LOAD_GRANULOMETRY_DATA Carga un archivo con datos de los resultados
% granulométricos y retorna una lista formateada.
%
%   LIST = LOAD_GRANULOMETRY_DATA(FILE) carga el archivo file y retorna una
%   lista con valores.
%
%   file: String con la ubicación del archivo a cargar.
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

% Se carga el archivo
f_id = fopen(file);
if f_id == -1
    error('Error when loading %s file', file);
end
f = textscan(f_id, '%s %s %s', 'delimiter', '\t');
fclose(f_id);

% Se crea una lista provisional
f_len = length(f{1});
p_list = cell(f_len, 1);
header_line_validated = false;
added_lines = 0;

% Se recorre el archivo
for i = 1:f_len
    
    m = f{1}{i}; % Malla
    ap = f{2}{i}; % Apertura
    pr = f{3}{i}; % Peso retenido
    
    % Se comprueba que la primera línea sea válida
    if ~header_line_validated
        header_line_validated = true;
        if ~all(ismember(ap, '0123456789+-.,eEdD#"')) % Header
            continue;
        end
    end
    
    % Se reemplazan elementos en valores
    m = strrep(m, '#', '');
    m = strrep(m, '', '');
    m = strrep(m, 'No.', '');
    m = strtrim(m);
    m = strrep(m, '"', '');
    ap = strrep(ap, ',', '.');
    ap = strrep(ap, '-', '');
    ap = strtrim(ap);
    pr = strrep(pr, ',', '.');
    pr = strtrim(pr);
    
    % Se comprueba que los tipos de datos sean válidos
    if and(~all(ismember(m, '0123456789 /')), i < f_len)
        error('Mesh value at line %i is not valid', i);
    end
    
    if ~all(ismember(ap, '0123456789+-.eE'))
        error('Aperture value at line %i is not valid', i);
    end
    
    if ~all(ismember(pr, '0123456789+-.eE'))
        error('Weight retained value at line %i is not valid', i);
    end
    
    % Se convierten los números
    ap = convert_fraction(ap);
    pr = convert_fraction(pr);
    
    % Se guarda la linea
    if i < f_len
        nlin = [convert_fraction(m), ap, pr];
    else
        nlin = [0, ap, pr];
    end
    p_list{i} = nlin;
    added_lines = added_lines + 1;
    
end

% Se crea la lista definitiva
list = cell(added_lines, 1);

k = 1;
for j = 1:length(p_list)
    if ~isempty(p_list{j})
        list{k} = p_list{j};
        k = k + 1;
    end
end

end

