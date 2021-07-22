function [paddedArray] = pad_array_replicate(input, padSize)
% Function that pads an input matrix with padSize by replicating the border
% padSize is an array - the first element gives the number of
% rows to add on each end and the second element is the same for columns

% Performs exactly the same as MATLAB's built-in function 'padarray' using 
% the 'replicate' option


% Call input matrix A and output matrix B to make code shorter & readable
A = input;
% Get dimensions of the input matrix
size = [length(A(:,1)) , length(A(1,:))];

% Create output matrix of zeros - size of input matrix and padding
B = zeros(length(A(:,1))+(padSize(1))*2, length(A(1,:))+(padSize(2))*2);

% Put input matrix in the middle of new matrix
B(padSize(1)+1:end-padSize(1), padSize(2)+1:end-padSize(2)) = A;

% Loops through the new added rows and replicates the border
for i = 1:padSize(1)
    B(i,padSize(2)+1:end-padSize(2)) = A(1,:);
    B(size(1)+padSize(1)+i,  padSize(2)+1:end-padSize(2)) = A(end,:);
end

% Loops through the new added columns and replicates the border
for j = 1:padSize(2)
    B(padSize(1)+1:end-padSize(1),j) = A(:,1);
    B(padSize(1)+1:end-padSize(1), size(2)+padSize(2)+j) = A(:,end);
end

% Fill out the corners by replicating each respective corner of the input
% and copying that to the new matrix corners
B(1:padSize(1), 1:padSize(2)) = A(1,1); % Top left
B(1:padSize(1), size(2)+padSize(2)+1:end) = A(1,end); % Top right
B(size(1)+padSize(1)+1:end, 1:padSize(2)) = A(end,1); % Bottom left
B(size(1)+padSize(1)+1:end, size(2)+padSize(2)+1:end) = A(end,end); %Bottom right

paddedArray = B;


    