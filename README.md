# Digital-Image-Processing
Course Project

## 1. Histogram Specification

The aim of this problem is to compute a transformation function in such a way that the transformed image histogram is close to that of the target image histogram.<br>
Input – Original Image, Target Image.<br>
Output – Histogram comparison between original, target and transformed image histograms.

<p align="center">
  <img width="460" height="300" src="1.%20Histogram%20Specification/givenhist.jpg"><br>
  <em>Original Image (givenhist.jpg)</em>
</p>

<p align="center">
  <img width="460" height="300" src="1.%20Histogram%20Specification/sphist.jpg"><br>
  <em>Target Image(Equilized Image) (sphist.jpg)</em>
</p>

<p align="center">
  <img width="460" height="300" src="1.%20Histogram%20Specification/histogram_output.jpg"><br>
  <em>Histogram of original, target and transformed images</em>
</p>

## 2. 2.	Bilateral Filtering

Bilateral filter is used to preserve edges with the fact that it depends largely on intensity(range filter) variation rather than spatial(domain filter) only. The filter is more sentitive to standard-deviation of range filter(sigma_r), and less sensitive to standard-deviation of domain filter(sigma_d). Let us experiment on some images and discuss some observation.

<b>White noise in dark background:</b> White pixels correspond to high pixel intensity and dark pixel corresponds to low pixel intensity. Let us consider only one center white pixel in between dark pixels. In this case the coefficients in range filter are very low because the difference is very high(white pixel intensity – dark pixel intensity) and exponent of -ve of this high value is very low. So the overall filter  doesnot vary much and the final pixel intensity is almost same earlier, because the dark pixels are nullified because low weight is given to  them and they add to negligibl amount to the filter calculation. Result: So, very bright pixels are retained and pixels relative to background dark pixels are filtered.<br>

<b>Black noise in white background:</b> The procedure is similar to that in the above case but the main difference is here the bright pixels are nullified retaining the dark pixels. 
