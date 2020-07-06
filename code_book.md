---
title: "code_book"
author: "Liyun"
date: "7/5/2020"
output: html_document
---

"code_book.txt" feature selection 
=================================
The output data set contains the extracted measurements on the mean and standard deviation for each measurement in the following dataset. Variables are in lower case without any '-' or '()'.

the features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tacc-xyz and tgyro-xyz. these time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 hz. then they were filtered using a median filter and a 3rd order low pass butterworth filter with a corner frequency of 20 hz to remove noise. similarly, the acceleration signal was then separated into body and gravity acceleration signals (tbodyacc-xyz and tgravityacc-xyz) using another low pass butterworth filter with a corner frequency of 0.3 hz. 

subsequently, the body linear acceleration and angular velocity were derived in time to obtain jerk signals (tbodyaccjerk-xyz and tbodygyrojerk-xyz). also the magnitude of these three-dimensional signals were calculated using the euclidean norm (tbodyaccmag, tgravityaccmag, tbodyaccjerkmag, tbodygyromag, tbodygyrojerkmag). 

finally a fast fourier transform (fft) was applied to some of these signals producing fbodyacc-xyz, fbodyaccjerk-xyz, fbodygyro-xyz, fbodyaccjerkmag, fbodygyromag, fbodygyrojerkmag. (note the 'f' to indicate frequency domain signals). 

these signals were used to estimate variables of the feature vector for each pattern:  
'-xyz' is used to denote 3-axial signals in the x, y and z directions.

tbodyacc-xyz
tgravityacc-xyz
tbodyaccjerk-xyz
tbodygyro-xyz
tbodygyrojerk-xyz
tbodyaccmag
tgravityaccmag
tbodyaccjerkmag
tbodygyromag
tbodygyrojerkmag
fbodyacc-xyz
fbodyaccjerk-xyz
fbodygyro-xyz
fbodyaccmag
fbodyaccjerkmag
fbodygyromag
fbodygyrojerkmag

the set of variables that were estimated from these signals are: 

mean: mean value
std: standard deviation
