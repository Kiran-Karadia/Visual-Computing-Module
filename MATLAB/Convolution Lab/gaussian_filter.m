function [kernel] = gaussian_filter(size,sigma)

% Check if dimensions are odd
if mod(size(1),2) == 0 || mod(size(2),2) == 0
    disp("Both dimensions must be an odd number!")
    return
end

% Get ranges used in for loops

rowRange = (size(1) - 1) / 2;
colRange = (size(2) - 1) / 2;

% Create column vector with values from rowRange
% Same length as filter dimensions but with centre 0
X = (-rowRange:rowRange)';

% Create row vector with values from colRange
% Same length as filter dimensions but with centre 0
Y = -colRange:colRange;


a = zeros(size(1),size(2));
% Duplicate rows to get to desired row length
for i = 1:size(1)
    a(i,:) = [Y];
end

b = zeros(size(1),size(2));
% Duplicate cols to get to desired column length
for i = 1:size(2)
    b(:,i) = [X];
end

% Calculate values for gaussian kernel
kernel = (1/(2*pi*sigma^2)) * exp(-(a.^2 + b.^2) / (2*sigma^2));

% Normalise values so the sum of the kernel = 1
kernel = kernel ./ (sum(sum(kernel)));

end

