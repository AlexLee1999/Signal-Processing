im1 = double(imread('../Pic/3.gif'));
im2 = double(imread('../Pic/4.gif'));
fft_im1 = fft2(im1);
fft_im2 = fft2(im2);
[M, N] = size(im1);
th = M / 30;
A = fft_im1;
B = fft_im2;

for i = 1:M

    for j = 1:N

        if ((i - 1 + j - 1) >= th) && ((M - (i - 1) + j - 1) >= th) && ((N - (j - 1) + i - 1) >= th) && ((M - (i - 1) + N - (j - 1)) >= th)
            A(i, j) = 0;
        else
            B(i, j) = 0;
        end

    end

end

C = A + B;
im = ifft2(C);
image(im);
colormap(gray(256))
