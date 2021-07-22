clear

left = im2double(imread('parade1.bmp'));
right = im2double(imread('parade2.bmp'));

% The warping transformation (rotation + scale about an arbitrary point).
load goodmatrix

target = backmap(left, H);

figure(1)
subplot(2,2,1); imshow(left)
subplot(2,2,2); imshow(right)
subplot(2,2,3); imshow(target)
subplot(2,2,4); imshow(imfuse(right, target))