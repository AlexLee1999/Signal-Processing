im = double(imread('/Pic/peppers.bmp'));
im0 = im;
[M, N, O] = size(im);
mat = [0.299 0.587 0.114; -0.169 -0.331 0.5; 0.5 -0.419 -0.081];
tic

for m = 1:M

    for n = 1:N
        A = mat * [im(m, n, 1); im(m, n, 2); im(m, n, 3)];
        A(1) = 255 * (A(1) / 255)^2;
        B = inv(mat) * A;
        im(m, n, 1) = B(1);
        im(m, n, 2) = B(2);
        im(m, n, 3) = B(3);
    end

end

toc
figure(1)
subplot(1, 2, 1)
image(im0 / 255);
subplot(1, 2, 2)
image(im / 255);
