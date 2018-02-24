%read the image
image = imread('cheetah.jpg');
im = rgb2gray(image);
figure,imshow(im)
%find the size of the image
[m,n] = size(im)
k = 15;      %kernel size can be 3-by-3 or 5-by-5 or 15-by-15
%determining size for padding zeros
p = m+k-1;
w = n+k-1;
%initialize the filtered image with padded zeros
filter_im = zeros(p,w);
filter_im(1:m,1:n) = im;
%convert the image with matrix of neighbourhood k-by-k pixels
col_n = im2col(filter_im, [k k]);
%sorting each column which depicts one neighbourhood for finding median
sort_col = sort(col_n, 1, 'ascend');
%now finding the median row after all the columns are sorted
medians = sort_col(floor(k^2/2)+1,:);
%finally reconstructing the image with medians of resp. neighbourhood
out_im = col2im(medians, [k k], [p w], 'sliding');
out_im = uint8(out_im);
%display output
size(out_im)
figure,imshow(out_im)
