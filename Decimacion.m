function [SignalResult, IndexResult] = Decimacion(SignalFromUser, Index, Factor)
    Origin = find(Index == 0);
    if(Origin ~= 1)
        FirstHalf = fliplr(SignalFromUser(1:Origin));
        SecondHalf = SignalFromUser(Origin:length(SignalFromUser));

        FirstHalf = fliplr(downsample(FirstHalf, Factor));
        SecondHalf = downsample(SecondHalf, Factor);

        if(length(SecondHalf) <= 1)
            SignalResult = FirstHalf;
        else
            SignalResult = horzcat(FirstHalf, SecondHalf(2:length(SecondHalf)));
        end
        
        IndexResult = -length(FirstHalf)+1:0;
        IndexResult = [IndexResult 1:length(SecondHalf)-1];
        disp(IndexResult);
    else
        SignalResult = downsample(SignalFromUser, Factor)';
        IndexResult = 0;
    end
end

