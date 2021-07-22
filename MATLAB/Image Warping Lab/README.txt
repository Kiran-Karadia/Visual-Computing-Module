-------------Scripts--------------------------------------
BackwardWarping.m	- Shows the results for both sections (Backward warping and Linear interpolation)

LensUndistortion.m 	- Undistorts the window.jpg image using the algorithm provided and using bi-linear.m

homogdemo.m		- Calculates the homography between the two parade images and warps the left image

-------------Notes----------------------------------------
By default homogdemo calculates the homography depeneding on the user's clicks and then warps the left image to the right

To load a previously calculated homgraphy matrix:
		Delete/comment out -load mymatrix- on line 76
		Uncomment -load goodMatrix- on line 79

The homograpy matrix saved in goodMatrix.mat gives the best result found

The last section %% Image Alignment can be run on its own if loading goodMatrix.mat

------------Functions-------------------------------------------------------
backmap.m	Performs the backmapping - bi-linear.m is also used within
bi-linear.m	Calculates the correct colour for a pixel using bi-linear interpolation