disp 'original colored'
logo = imread('selfie.jpg');
imshow(logo)

logo_gs = rgb2gray(logo); % convert to grayscale
logo_double = im2double(logo_gs); % convert entries of matrix to double
disp 'original greyscale'
imshow(logo_double)

[u,s,v]=svd(logo_double); % 300 singular values

% image with 10% of singular values kept
s2 = s;
s2(31:end, :) = 0; s2(:, 31:end) = 0; % keeping only 30 singular values
%print image
IM=u*s2*v';
disp '10%'
imshow(IM)

% image with 30% of singular values kept
s3 = s;
s3(91:end, :) = 0; s2(:, 91:end) = 0; % keeping only 90 singular values
%print image
IM2=u*s3*v';
disp '30%'
imshow(IM2)

% image with 50% of singular values kept
s3 = s;
s3(151:end, :) = 0; s2(:, 151:end) = 0; % keeping only 150 singular values
%print image
IM2=u*s3*v';
disp '50%'
imshow(IM2)
