clear
clf


%% Basic Convolution
image = im2double(imread("cameraman.tif"));

kernel = ones(5) / (5)^2;
basicResult = basic_convolution(image, kernel);

figure(1)
subplot(1,3,1); imshow(image); title("Original Iamge");
subplot(1,3,2); imshow(basicResult); title("Basic Convolution (5x5 avg)");

kernel = [-1 0 1];  % Test for general (2n+1)x(2m+1) kernels 
basicResultGeneral = basic_convolution(image, kernel);
subplot(1,3,3); imshow(basicResultGeneral); title("Kernel = [-1 0 1]");

%% Border handling
image = im2double(imread("cameraman.tif"));

kernel = ones(5) / (5)^2;
extendedResult = extended_convolution(image, kernel);
reference = imfilter(image, kernel, 'replicate');
[difference, ssd] = calc_ssd(extendedResult, reference);

kernel2 = [-1 0 1];
extendedResult2 = extended_convolution(image, kernel2);
reference2 = imfilter(image, kernel2, 'replicate');
[difference2, ssd2] = calc_ssd(extendedResult2, reference2);

figure(2)       
subplot(2,3,1); imshow(extendedResult);  title(sprintf('Extended convolution\n 5x5 avg kernel'));
subplot(2,3,2); imshow(reference);       title('Reference result');
subplot(2,3,3); imshow(difference);      title(sprintf('Difference (SSD=%.1f)',ssd));
subplot(2,3,4); imshow(extendedResult2); title(sprintf('Extended convolution\n [-1 0 1] kernel'));
subplot(2,3,5); imshow(reference2);      title('Reference result');
subplot(2,3,6); imshow(difference2);     title(sprintf('Difference (SSD=%.1f)',ssd2));

%% Image filtering
image = im2double(imread("cameraman.tif"));

horizontalKernel = [1 2 1; 0 0 0; -1 -2 -1];
horizontal = extended_convolution(image, horizontalKernel);

verticalKernel = [1 0 -1; 2 0 -2; 1 0 -1];
vertical = extended_convolution(image, verticalKernel);

diagonalKernel = [2 1 0; 1 0 -1; 0 -1 -2];
diagonal = extended_convolution(image, diagonalKernel);

unsharpMaskingKernel = [0 -1 0; -1 5 -1; 0 -1 0];
unsharpMasking = extended_convolution(image, unsharpMaskingKernel);

kernel = [5 5];     % Gaussian kernel size set here
sigma = 1;          % Sigma set here

gaussian_kernel = gaussian_filter(kernel, sigma);
gaussian = extended_convolution(image, gaussian_kernel);

check = sum(gaussian_kernel(:));    % Check display if kernel is normalised
fprintf("Normalisation check: sum(gaussian_kernel(:)) = %1.0f \n", check);

figure(3)
subplot(2,3,1); imshow(image);          title("Original Image");
subplot(2,3,2); imshow(horizontal);     title("Horizontal");
subplot(2,3,3); imshow(vertical);       title("Vertical");
subplot(2,3,4); imshow(diagonal);       title("Diagonal");
subplot(2,3,5); imshow(unsharpMasking); title("Unsharp Masking");
subplot(2,3,6); imshow(gaussian);       title("Gaussian Blur");

%% Convolution theorem
image = im2double(imread("cameraman.tif"));

kernel = ones(5) / (5)^2;
convFiltered = conv_theorem(image, kernel);
convReference = imfilter(image, kernel, 'replicate');
[convDifference, convSSD] = calc_ssd(convFiltered, convReference);

figure(4)
subplot(1,3,1); imshow(convFiltered);     title('Convolution Theorem (FFT)');
subplot(1,3,2); imshow(convReference);    title('Library Function');
subplot(1,3,3); imshow(convDifference);   title(sprintf('Difference (SSD=%.1f)',convSSD));


kernel3x3 = [-1 0 1];
[fft1, extend1] = time_test(image, kernel3x3, 5);

kernel9x9 = ones(9) / (9)^2;
[fft2, extend2] = time_test(image, kernel9x9, 6);

kernel15x15 = ones(15) / (15)^2;
[fft3, extend3] = time_test(image, kernel15x15, 7);

kernel30x30 = ones(35) / (35)^2;
[fft4, extend4] = time_test(image, kernel30x30, 8);



