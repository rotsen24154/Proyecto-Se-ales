function [SignalResult] = Ampliacion(SignalFromUser, AmpliationFactor)
    SignalResult = SignalFromUser'*AmpliationFactor;
end