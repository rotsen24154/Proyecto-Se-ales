function [SignalResult, IndexResult] = Desplazamiento(SignalFromUser, Index, Factor)
    Origin = find(Index == 0) - 1;
    Aumentar = Origin + Factor;
    if(Aumentar < 0)
        SignalResult = [zeros(1,abs(Aumentar)) SignalFromUser'];
        IndexResult = 0:length(SignalResult)-1;
    elseif(Aumentar > length(SignalFromUser) )
        SignalResult = [SignalFromUser' zeros(1,Aumentar + 1 - length(SignalFromUser))];
        IndexResult = -length(SignalResult)+1:0;
    else
        SignalResult = SignalFromUser';
        IndexResult = Index - Factor;
    end
    
end