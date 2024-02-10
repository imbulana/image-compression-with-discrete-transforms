Full Discrete Wavelet Transform

% Haar low pass filter
h_haar=1/sqrt(2) * [1 1]';

% Daubechies 4 low pass filter
c=2-sqrt(3);
h_db4=1/(sqrt(2)*(c^2+1)) * [1-c 1+c c*(c+1) c*(c-1)]';

% Full Discrete Wavelet Transform 
% s - input signal given as 1D vector of length D where D is of form D=2^N
% h - low pass filter of length L<=D
function y=dwt(s,h)
    D=length(s);
    L=length(h);
    y=zeros(D,1);
    
    % construct high pass filter g from h
    g=zeros(L,1);
    for i=1:2:L
        g(i)=h(L-i+1);
        g(i+1)=-h(L-i);
    end

    j=1;
    while L<=D
        W=zeros(D,1);

        D=D/2;
        lower=1;
        for i=1:D
            upper=lower+L-1;
            
            % concatenate entries from the beginning of
            % sequence if upper>end of s
            if upper>2*D
                s_tmp=[s(lower:end);s(1:end-lower+1)];
            else
                s_tmp=s(lower:upper);
            end
            
            % apply filters g and h to ith set of L entries
            W(i)=dot(s_tmp,h); % H
            W(D+i)=dot(s_tmp,g); % G

            lower=lower+2; % shift filter by 2 positions
        end

        y(j:j+D-1)=W(D+1:end); % append G to output vector
        j=j+D;

        s=W(1:D); % set s to new approximation H
    end

    y(j:end)=s; % append final s to output vector
end
