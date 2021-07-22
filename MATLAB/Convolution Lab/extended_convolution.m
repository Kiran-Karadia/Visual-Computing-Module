function [output] = extended_convolution(image, kernel)

% Get dimensions of the image
imageRow = length(image(:,1));
imageCol = length(image(1,:));

% Get dimensions of the kernel
kerDim = [length(kernel(:,1)) , length(kernel(1,:))];

% Get kernel range to be used in for loop
% Loop iterates as if the centre of the kernel has coordinates (0,0)
kerRowRange = (kerDim(1)-1)/2;
kerColRange = (kerDim(2)-1)/2;

% Offset to get the relative position of the kernel value from the centre
% (Since MATLAB cannot handle a negative index)
rowOffset = (kerDim(1)+1)/2;
colOffset = (kerDim(2)+1)/2;

% Pad the image by replicating the borders outward 
paddedImage = pad_array_replicate(image, [kerRowRange kerColRange]);

% Create an array of zeros the same size as the padded image
output = zeros(length(paddedImage(:,1)), length(paddedImage(1,:)));

% Iterate through every pixel in the image
for currentRow = rowOffset : imageRow+(rowOffset-1)
    for currentCol = colOffset : imageCol+(colOffset-1)
        accumulator = 0;
        
        % Iterate through every element in the kernel
        for kerRow = -kerRowRange : kerRowRange
            for kerCol = -kerColRange : kerColRange
                            
                % Get value of the current pixel
                pixelValue = paddedImage(currentRow+kerRow, currentCol+kerCol);
                % Get value of the corresponding kernel element
                kernelValue = kernel(kerRow+rowOffset, kerCol+colOffset);
                
                result = pixelValue * kernelValue;
                accumulator = accumulator + result;
            end
        end
        output(currentRow, currentCol) = accumulator;
    end
end
% Remove the padding so output image is the same size as original image
output = output(rowOffset:end-(rowOffset-1), colOffset:end-(colOffset-1));

end



