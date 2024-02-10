Discrete Haar Transform
A=double(imread('cameraman.tif'));

A_haar=haar2_l1(A);
colormap gray;
imagesc(A_haar)

function W=haar1_l1(x) % 1D level 1 haar transform
    L=length(x);
    W=zeros(L,1);
    L=L/2;
    for n=1:L
        W(n)=(1/sqrt(2))*(x(2*n-1)+x(2*n));
        W(L+n)=(1/sqrt(2))*(x(2*n-1)-x(2*n));
    end
end

function s=haar2_l1(s) % 2D level 1 haar transform
    m=length(s(1,:));
    n=length(s(:,1));

    % apply single level haart to rows
    for i=1:m
        s(i,:)=haar1_l1(s(i,:)')';
    end

    % apply single level haart to to columns
    for i=1:n
        s(:,i)=haar1_l1(s(:,i));
    end
end

