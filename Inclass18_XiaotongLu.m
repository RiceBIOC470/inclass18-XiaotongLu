% In class 18

% Problem 1. In this directory, you will find the same image of yeast cells as you used
% in homework 5. First preprocess the image any way you like - smoothing, edge detection, etc. 
% Then, try to find as many of the cells as you can using the
% imfindcircles routine with appropriate parameters. 
% Display the image with the circles drawn on it.  
img=imread('yeast.tif');
imshow(img)
img1_filter=imfilter(img,fspecial('gaussian',4,2));
img1_bg=imopen(img1_filter,strel('disk',100));
img1_bgsub=imsubtract(img1_filter,img1_bg);
img_thre=img1_bgsub>25;
imshow(img_thre);
edge_img = edge(img_thre, 'canny');
imshow(edge_img, []);
[centers,radii]=imfindcircles(edge_img,[15 25],'Sensitivity',0.93);
imshow(img,[]);
centers;
hold on;
for ii=1:length(centers)
    drawcircle(centers(ii,:),radii(ii),'m');
end


% Problem 2. (A) Draw two sets of 10 random numbers - one from the integers
% between 1 and 9 and the second from the integers between 1 and 10. Run a
% ttest to see if these are significantly different. (B) Repeat this a few
% times with different sets of random numbers to see if you get the same
% result. (C) Repeat (A) and (B) but this time use 100 numbers in each set
% and then 1000 numbers in each set. Comment on the results. 
%(A)
A=randi(9,[10 1]);
B=randi(10,[10 1]);
[is_sig,pval]=ttest2(A,B);
%(B)
for i=1:100
    xx=randi(9,[10 1]);
    yy=randi(10,[10 1]);
    [is_sig(ii),pval(ii)]=ttest2(xx,yy);
end
sum(is_sig)
%(C)
%repeat A with 100 number
AA=randi(9,[100 1]);
BB=randi(10,[100,1]);
[is_sig,pval]=ttest2(AA,BB);
%repeat B with 100 number
for i=1:200
    xx=randi(9,[100 1]);
    yy=randi(10,[100 1]);
    [is_sig(ii),pval(ii)]=ttest2(xx,yy);
end
sum(is_sig)
%repeat A with 100 number
AAA=randi(9,[1000 1]);
BBB=randi(10,[1000,1]);
[is_sig,pval]=ttest2(AAA,BBB);
%repeat B with 100 number
for i=1:200
    xx=randi(9,[1000 1]);
    yy=randi(10,[1000 1]);
    [is_sig(ii),pval(ii)]=ttest2(xx,yy);
end
sum(is_sig)
%comment: With the growing in the numbers in each set and the loop times , the p value continue
%to decrease.That means the difference betweet these two set gradually becomes not significant.And the distribution 
%of this two set is getting closer to uniform distribution.