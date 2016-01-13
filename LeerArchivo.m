function [SignalFromUser, Index, Frecuencia] = LeerArchivo(Path,Type)
    if(strcmp(Type,'audio'))
        [SignalFromUser, Frecuencia] = audioread(Path); 
        Index = 0;
    else
        Tmp = csvread(Path);
        SignalFromUser = Tmp(1,:);
        Index = 1-Tmp(2,1):length(SignalFromUser)-Tmp(2,1);
        Frecuencia = 0;
    end
end

