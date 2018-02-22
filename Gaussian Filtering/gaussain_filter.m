%read the image
image = imread('cheetah.jpg');
im = rgb2gray(image);
figure,imshow(im)
%find the size of the image
[m,n] = size(im);
k = 5; %size of the gaussian kernel
sigma = 1; %variance of gaussian dist.
%creating the gaussian kernel with k-by-k size using gaussian formula
%creating a meshgrid to define kernel
coord = -floor(k/2) : floor(k/2);
[x y] = meshgrid(coord, coord);
%defining gaussian dist. 
g = (1/(2*pi*sigma)) * exp(- (x.^2 + y.^ 2) / (2*sigma*sigma)); 
%apply filter to the image by creating a padded image for corner cases 
p = m + k - 1;
w = n + k - 1;
filter_im = zeros(p,w);
filter_im(1:m,1:n) = im;
%convert the neighbourhood into matrix columns
col_n = im2col(filter_im, [k k]);
%apply filter to each column which specifies one neighbourhood
im_fil = sum(col_n .* g(:));  %element-wise operation 
%fil_out = sum(col_n, 1); 
%reconstruct the output filtered image
out_im = col2im(im_fil, [k k], [p w], 'sliding');
out_im = uint8(out_im);
%display
figure,imshow(out_im)


