function [difference, ssd] = calc_ssd(image1,image2)
% Calculate the sum of squared differences of 2 images
difference = 0.5 + 10 * (image1 - image2);
ssd = sum((image1(:) - image2(:)) .^ 2);

end

