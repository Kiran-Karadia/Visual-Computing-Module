function [target] = backmap(source, M)

target = zeros(size(source));

% The backward mapping loop: iterate over every target pixel
for y = 1:size(source, 1)
    for x = 1:size(source, 2)

        % Transform target pixel to original source pixel
        pprime = [x; y; 1];
        p = inv(M) * pprime;
        u = p(1);
        v = p(2);

        % Check if target pixel falls inside the image domain.
        if (u >= 1 && v >= 1 && u < size(target, 2) && v < size(target, 1))
            % Sample the target pixel colour from the source pixel.
                colour = bi_linear(source, v, u);
                target(y, x, :) = colour;
        end
    end
end


