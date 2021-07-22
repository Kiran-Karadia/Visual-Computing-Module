Each script can just be run to show the results

--------------rotate2D_cols.m and rotate2D_rows.m------------------------ 
Both output the same result but one uses column vectors and the other uses row vectors in the script
Modifying the point coordinate on line 16 makes the square rotate about the new position

--------------earthmoon.m------------------------------
Running should show 2 moons orbiting 'Earth' and a third moon orbiting the second (red) moon


--------------transforms.m-----------------------------
Every letter has a single transform that makes the 'F' fall into each outlined 'F'
These were calculated by diving the new location points by the original points (as matrices)
The last purple F transformation matrix was calculated by calculating the homography
