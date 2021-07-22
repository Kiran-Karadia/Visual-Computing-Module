
-------------------------Scripts-----------------------------------

ConvLab.m - 	Main script
		Running this script will perform every task that is described in the specification
		The code is split into 'sections' where each section can be individually run to only show the results of a desired task
		This can be done by first having the cursor within a section, and pressing Ctrl+Enter or by pressing the 'Run Section' button within the 'EDITOR' toolbar at the top. 


------ Desscription of all functions -------------------------------------------------------

basic_convolution.m	Performes the basic convolution by using the algorithm provided in the specification
calc_ssd.m		Calculate the sum of squared differences (SSD)
conv_theorem.m		Filter an image using the FFT to perform the convolution
extended_convolution.m	Perform convolution where borders are now handled (by replicating the edge pixels)
gaussian_filter.m	Calculate a kernel for Gaussian blur
pad_array_replicate.m	Pad an array by replicating border values - same result as MATLAB's padarray using the 'replicate' parameter
time_test.m		Compare the run-time of conv_theorem.m and extended_convolution.m


------ Description of all figures ----------------------------------------------------
The figure numbers have been manually set so that the same section will overwrite the same figure

Figure 1 - Basic Convolution
	Shows the original image
	Basic convolultion using a 5x5 average filter
	The same convolution algorithm with a kernel of [-1 0 1]

Figure 2 - Border handling
	Shows filtered result from using the 'extended_convolution' function
	Shows result of using MATLAB's 'imfilter' function with the 'replicate' option
	Top row images uses a 5x5 average filter and shows SSD result
	Bottom row images uses a kernel of [-1 0 1] and shows SSD result

Figure 3 - Image filtereing
	Shows the original image and result of 5 different kernels
	Bottom right figure shows Gaussian Blur with a 5x5 kernel and a sigma of 1

Figure 4 - Convolution theorem
	Shows filtered image using conv_theorem function and SSD compared to MATLAB's library function

Figure 5,6,7,8 - Run-time comparisions
	Shows the results of 4 different run-time comparisons




								

