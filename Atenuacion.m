function [SignalResult] = Atenuacion(SignalFromUser, AttenuationFactor)
    SignalResult = SignalFromUser/AttenuationFactor;
end

