function [SignalResult, IndexResult] = Interpolacion(SignalFromUser, Factor, Index)
    SignalResult = upsample(SignalFromUser,Factor);
    for v = 2:Factor:length(SignalResult)
        try
            Inicial = SignalResult(v-1);
            Final = SignalResult(v+Factor-1);
        catch
            Final = 0;
        end
        SignalResult(v) = Inicial + (Final-Inicial)/Factor;
        Aumento = SignalResult(v) - Inicial;
        for w = v+1:v+Factor-2
            SignalResult(w) = SignalResult(w-1) + Aumento;
        end
    end
    Origin = find(Index == 0)-1;
    IndexResult = -Origin*Factor:length(SignalResult)-1-Origin*Factor;
end