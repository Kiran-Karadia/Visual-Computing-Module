clear

source = im2double(imread('mona.jpg'));

T = [1 0 -size(source, 2) / 2; 0 1 -size(source, 1) / 2; 0 0 1];
t = pi / 4 ;
R = [cos(t) -sin(t) 0; sin(t) cos(t) 0; 0 0 1];
S = [4 0 0; 0 4 0; 0 0 1];

% The warping transformation (Rotate pi/4 and 4x zoom)
M = inv(T) * R * S * T;

target = backmap(source, M);

% Second warping transformation (Rotate -3pi/4 and 0.75x zoom)
t2 = -3*pi / 4;
R2 = [cos(t2) -sin(t2) 0; sin(t2) cos(t2) 0; 0 0 1];
S2 = [0.75 0 0; 0 0.75 0; 0 0 1];
M2 = inv(T) * R2 * S2 * T;

target2 = backmap(source, M2);

% Display source image and 2 results
figure(1)
subplot(1,3,1); imshow(source); title("Source");
subplot(1,3,2); imshow(target); title("First result");
subplot(1,3,3); imshow(target2); title("Second result");
