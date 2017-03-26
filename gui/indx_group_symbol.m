function indx = indx_group_symbol(s, t)
%INDX_GROUP_SYMBOL Esta función retorna el índice para cada símbolo de
%grupo.
%   INDX = INDX_GROUP_SYMBOL(S,T) retorna el índice asociado al símbolo del
%   grupo S para el tipo T.
%
%   T=0: Gravas
%   T=1: Arena

if not(or(t == 0, t == 1))
    error('Parameter t not valid, should be 0 or 1 for gravel and sand respectively.');
end

if not(ischar(s))
    error('Group symbol must be an string.');
else
    s = upper(s);
    if t == 0
        if strcmp(s, 'GW')
            indx = 0;
        elseif strcmp(s, 'GP')
            indx = 1;
        elseif strcmp(s, 'GW-GM')
            indx = 2;
        elseif strcmp(s, 'GW-GC')
            indx = 3;
        elseif strcmp(s, 'GP-GM')
            indx = 4;
        elseif strcmp(s, 'GP-GC')
            indx = 5;
        elseif strcmp(s, 'GM')
            indx = 6;
        elseif strcmp(s, 'GC')
            indx = 7;
        elseif strcmp(s, 'GC-GM')
            indx = 8;
        else
            error('Unrecognized gravel group symbol %s.', s);
        end
    elseif t == 1
        if strcmp(s, 'SW')
            indx = 9;
        elseif strcmp(s, 'SP')
            indx = 10;
        elseif strcmp(s, 'SW-SM')
            indx = 11;
        elseif strcmp(s, 'SW-SC')
            indx = 12;
        elseif strcmp(s, 'SP-SM')
            indx = 13;
        elseif strcmp(s, 'SP-SC')
            indx = 14;
        elseif strcmp(s, 'SM')
            indx = 15;
        elseif strcmp(s, 'SC')
            indx = 16;
        elseif strcmp(s, 'SC-SM')
            indx = 17;
        else
            error('Unrecognized sand group symbol %s.', s);
        end
    end
end

end

