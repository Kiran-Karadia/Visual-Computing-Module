function [colour] = bi_linear(source, v, u)

% Get the 4 closest pixel coordinates in the source image
y1 = floor(v);
y2 = y1 + 1;
x1 = floor(u);
x2 = x1 + 1;

% Get the colour of each colest pixel
Q11 = source(y1, x1, :);
Q12 = source(y1, x2, :);
Q21 = source(y2, x1, :);
Q22 = source(y2, x2, :);


% Interpolate across top left and top right pixel
f1 = ((x2-u)*Q11) + ((u-x1)*Q12);

% Interpolate across bottem left and bottom right pixel
f2 = ((x2-u)*Q21) + ((u-x1)*Q22);

% Interpolate across previous values
colour = ((y2-v)*(f1)) + ((v-y1)*(f2));


end
