close all;
clear all;

% Read in two photos of the library.
left  = im2double(imread('parade1.bmp'));
right = im2double(imread('parade2.bmp'));

% Draw the left image.
figure(1);
image(left);
axis equal;
axis off;
title('Left image');
hold on;

% Draw the right image.
figure(2);
image(right);
axis equal;
axis off;
title('Right image');
hold on;
markerSize = 12;
linewidth = 4;
% Get 4 points on the left image.
figure(1);
[x, y] = ginput(4);
leftpts = [x'; y'];
% Plot left points on the left image.
figure(1)
plot(leftpts(1,:), leftpts(2,:), 'rx', 'MarkerSize', markerSize, 'LineWidth', linewidth);

% Get 4 points on the right image.
figure(2);
[x, y] = ginput(4);
rightpts = [x'; y'];
% Plot the right points on the right image
figure(2)
plot(rightpts(1,:), rightpts(2,:), 'gx', 'MarkerSize', markerSize, 'LineWidth', linewidth);

% Make leftpts and rightpts (clicked points) homogeneous.
leftpts(3,:) = 1;
rightpts(3,:) = 1;

%% TODO: compute the homography between the left and right points.
H = calchomography(leftpts, rightpts);


%% TODO: have user click on left image, and plot their click. Then estimate
%        point in right image using the homography and draw that point.

% Prompt the user with a message box - code stops until user presses 'OK'
msgbox("Click somewhere on the left image and a marker will appear on the right image at the corresponding point!", 'modal')

% Get the clicked point on the left image
figure(1)
[x, y] = ginput(1);
newleftpts = [x';y';1];
figure(1)
plot(newleftpts(1,:), newleftpts(2,:), 'bx', 'MarkerSize', markerSize, 'LineWidth', linewidth);

% Display the corresponding point on the right image
figure(2)
newpts = H * newleftpts;
newpts(3,:) = 1;
figure(2)
plot(newpts(1,:), newpts(2,:), 'bx', 'MarkerSize', markerSize, 'LineWidth', linewidth);

% Save the homography calculated
save mymatrix H

%% Image Alignment
clear

left = im2double(imread('parade1.bmp'));
right = im2double(imread('parade2.bmp'));

% Load newly calculated matrix
load mymatrix

% Uncomment to line below to load previously saved matrix (best result)
%load goodMatrix

target = backmap(left, H);

figure
subplot(2,2,1); imshow(left); title("Left image");
subplot(2,2,2); imshow(right); title("Right image");
subplot(2,2,3); imshow(target); title("Warped left image");
subplot(2,2,4); imshow(imfuse(right, target)); title("Warped left image + right image");