function [filtered] = conv_fft(image,kernel)
% Flip rows and columns in kernel - needed for asymmetric kernels
kernel = rot90(kernel, 2);

kerRowRange = (length(kernel(:,1)) - 1) / 2;
kerColRange = (length(kernel(1,:)) - 1) / 2;

% Pad image - replicating the border
image = pad_array_replicate(image, [kerRowRange kerColRange]);

% fft2 requires both inputs to be the same size
rowPadding = length(image(:,1)) + length(kernel(:,1)) - 1;
colPadding = length(image(1,:)) + length(kernel(1,:)) - 1;

% Convolution is multiplication in the Fourier domain
% Get fft of input image and fft of kernel
fftImage = fft2(image, rowPadding, colPadding);
fftKernel = fft2(kernel, rowPadding, colPadding);

% Multiply then inverse to get filtered output image
filtered = ifft2(fftImage .* fftKernel);

% Remove the padding so output image is the same size as original image
filtered = filtered((kerRowRange*2)+1:end-(kerRowRange*2), (kerColRange*2)+1:end-(kerColRange*2));

end

