function [SignalResult, Index] = Reflejo(SignalFromUser, Index)
    SignalResult = fliplr(SignalFromUser');
    Index = fliplr(Index)*-1;
end

