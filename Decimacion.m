function [SignalResult] = Decimacion(SignalFromUser, Origin, Factor)
    FirstHalf = fliplr(SignalFromUser(1:Origin));
    SecondHalf = SignalFromUser(Origin:length(SignalFromUser));
    
    FirstHalf = fliplr(downsample(FirstHalf, Factor));
    SecondHalf = downsample(SecondHalf, 2);
    
    if(length(SecondHalf) <= 1)
        SignalResult = FirstHalf;
    else
        SignalResult = horzcat(FirstHalf, SecondHalf(2:length(SecondHalf)));
    end
end

