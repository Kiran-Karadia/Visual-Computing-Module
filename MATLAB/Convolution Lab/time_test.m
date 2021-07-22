function [fftAvgTime,extendAvgTime] = time_test(image,kernel, figNum)

fftTest = zeros(10);
extendTest = zeros(10);

% Do 10 test runs using each function
for i = 1:10
    tic;
    fftResult = conv_theorem(image, kernel);
    fftTest(i) = toc;
    
    tic;
    extendResult = extended_convolution(image, kernel);
    extendTest(i) = toc;
end

% Get the average run-time and convert to miliseconds
fftAvgTime = mean(fftTest(:)) * 1000;
extendAvgTime = mean(extendTest(:)) * 1000;

% Display results of each function and average run-time
figure(figNum)
subplot(1,2,1); imshow(fftResult); title(sprintf("FFT - avg time = %2.7f ms", fftAvgTime));
subplot(1,2,2); imshow(extendResult); title(sprintf("Extended - avg time = %2.7f ms", extendAvgTime));

