plague-recog
============

plague recognizer for my physiology prof.

Well,
it is a matlab script for my physiology lab ,
to recognize and find the areas of plagues.

It is a part of <Supervised Segmentation of Virus Plaque Using Multilinear Regression>
And the OpenCFU project have some similiar function, since that, this project is out dated.

Mainly,in that procedure:
1.fix the background distort with 5*5 pixel in 4 conors
2.select 2 sets of points , the a logistic regression
3.convert RGB to logit to make difference  significant
4.use threshold to get BW image
5.close operation to diminish small pieces
6.some way to test if it is the plague,NOT finished yet

