function [SignalResult] = Decimacion(SignalFromUser, Index, Factor)
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
    else
        SignalResult = downsample(SignalFromUser, Factor)';
    end
end

