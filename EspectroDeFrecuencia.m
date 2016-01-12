function z = EspectroDeFrecuencia(x)
    N=length(x);
    nfft=2^ceil(log2(N));
    z=zeros(1,nfft);
    Sum=0;
    for k=1:nfft
        for jj=1:N
            Sum=Sum+x(jj)*exp(-2*pi*1j*(jj-1)*(k-1)/nfft);
        end
        z(k)=Sum;
        Sum=0;% Reset
    end
return