im = double(imread('/Pic/3.gif'));
A = zeros(512, 512);

for m = 2:511

    for n = 2:511
        A(m, n) = (8 .* im(m, n) - im(m + 1, n) - im(m - 1, n) - im(m + 1, n - 1) - im(m, n - 1) - im(m - 1, n - 1) - im(m + 1, n + 1) - im(m, n + 1) - im(m - 1, n + 1)) ./ 8;
    end

end

image(A);
colormap(gray(256))
