im = double(imread('/Pic/peppers.bmp'));

[M, N, O] = size(im);
mat = [0.299 0.587 0.114; -0.169 -0.331 0.5; 0.5 -0.419 -0.081];

for m = 1:M

    for n = 1:N
        A = mat * [im(m, n, 1); im(m, n, 2); im(m, n, 3)];
        A(1) = 255 * (A(1) / 255)^0.5;
        B = inv(mat) * A;
        im(m, n, 1) = B(1);
        im(m, n, 2) = B(2);
        im(m, n, 3) = B(3);
    end

end

image(im / 255);
imshow(im / 255);
