%read the image
image = imread('cheetah.jpg');
im = rgb2gray(image);
figure,imshow(im)
%find the size of the image
[m,n] = size(im);
%kernel used for the sharpening
k = [1 1 1;1 -9 1;1 1 1]; 
%apply filter to the image by creating a padded image for corner cases 
p = m + 3 - 1;
w = n + 3 - 1;
filter_im = zeros(p,w);
filter_im(1:m,1:n) = im;
%initializing the image dimension to im2
im2 = zeros(m,n);
%looping to each neighbourhood and multiplying with kernel, and summing
for i = 2:m-1
    for j = 2:n-1
        im2(i,j) = sum(sum(k .* filter_im(i-1:i+1,j-1:j+1)));
    end
end
im2 = uint8(im2); %prevent saturation at 255
%display filtered image
figure, imshow(im2)
%get the sharpened image 
out_im = im - im2;
figure, imshow(out_im)