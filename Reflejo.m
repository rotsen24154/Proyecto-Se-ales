function [SignalResult, Index] = Reflejo(SignalFromUser)
    SignalResult = fliplr(SignalFromUser);
    Index = [1,2,3,4,5,6,7];
end

