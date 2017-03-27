function list = load_granulometry_excel(excel_file)
% LOAD_GRANULOMETRY_EXCEL Carga un archivo con datos de los resultados
% granulométricos y retorna una lista formateada.
%
%   LIST = LOAD_GRANULOMETRY_EXCEL(FILE) carga el archivo file y retorna una
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

% Se importan configuraciones
config;

% Se carga el archivo
[~, ~, raw] = xlsread(excel_file);

% Se comprueban las dimensiones
[nRows, nCols] = size(raw);

% Si hay mas de 3 columnas
if nCols ~= 3
    error('Excel only can have 3 columns');
end

% Se crea la lista
list = cell(nRows-1, 1);
for j = 1:nRows - 1
    
    m = num2str(raw{j+1, 1}); % Malla
    ap = num2str(raw{j+1, 2}); % Apertura
    pr = num2str(raw{j+1, 3}); % Peso retenido
    
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
    if and(~all(ismember(m, '0123456789 /')), j < (nRows - 1))
        error('Mesh value at line %i is not valid', j);
    end
    
    if ~all(ismember(ap, '0123456789+-.eE'))
        error('Aperture value at line %i is not valid', j);
    end
    
    if ~all(ismember(pr, '0123456789+-.eE'))
        error('Weight retained value at line %i is not valid', j);
    end
    
    % Se convierten los números
    ap = convert_fraction(ap);
    pr = convert_fraction(pr);
    
    % Se guarda la linea
    if j < (nRows - 1)
        nlin = [convert_fraction(m), ap, pr];
    else
        nlin = [0, ap, pr];
    end
    
    list{j} = nlin;
end

end

