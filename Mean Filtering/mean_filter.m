%Matlab code for applying median filtering is as follows:
%reading an image
image = imread('cheetah.jpg');
im = rgb2gray(image); %converting to grayscale
figure,imshow(im) 
%getting the size of the image
[m, n] = size(im);
%intializing output image after filtering
filter_im = zeros(m,n);
%looping through each pixel
for i = 2:m-1
    for j = 2:n-1
        %cal mean of all 8 neighbours for every pixel in the image
        filter_im(i,j) = mean2(im(i-1:i+1,j-1:j+1)); 
    end
end
filter_im = uint8(filter_im); %prevent from saturating at 255
%display the mean filtered image
figure,imshow(filter_im)
        
                