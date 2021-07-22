fx = 474.53;
px = 405.96;
fy = 474.53;
py = 217.81;
k1 = -0.27194;
k2 = 0.11517;
k3 = -0.029859;

source = im2double(imread("window.jpg"));
result = zeros(size(source));

% Iterate through every pixel
for u = 1:size(source,2)
    for v = 1:size(source,1)
        % Warping algorithm from coursework specification
        x = (u-px)/fx;
        y = (v-py)/fy;
        r = sqrt((x^2) + (y^2));
        xprime = x * (1 + k1*(r^2) + k2*(r^4) + k3*(r^6));
        yprime = y * (1 + k1*(r^2) + k2*(r^4) + k3*(r^6));
        uprime = (xprime * fx) + px;
        vprime = (yprime * fy) + py;
        
        if uprime >= 1 && uprime <= size(source,2) && vprime >= 1 && vprime <= size(source,1)
            colour = bi_linear(source, vprime, uprime);
            result(v,u, :) = colour;
        end
    end
end

figure
subplot(1,2,1); imshow(source); title("Original image");
subplot(1,2,2); imshow(result); title("Undistorted image");



        