Discrete Fourier Transform

function x=dft(x)
    N=length(x);
    DFT=ones(N);
    for m=1:N-1
        for n=1:N-1
            DFT(m+1,n+1)=cos(-2*pi*m*n/N)+1j*sin(-2*pi*m*n/N);
        end
    end
    x=1/sqrt(N) * DFT*x;
end