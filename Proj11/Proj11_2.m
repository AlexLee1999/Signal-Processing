im = double(imread('../Pic/3.gif'));
[M, N] = size(im);
A = [1 0; -0.3 1];

inv(A);
B = zeros(M, N);
[nx2, ny2] = meshgrid([1:M], [1:N]);
nx1 = zeros(M, N);
ny1 = zeros(M, N);

for i = 1:M

    for j = 1:N
        mat = (inv(A) * [nx2(i, j) - 256; ny2(i, j) - 256]);
        nx1(i, j) = mat(1) + 256;
        ny1(i, j) = mat(2) + 256;
    end

end

for i = 1:M

    for j = 1:N
        m2 = floor(ny1(i, j));
        n2 = floor(nx1(i, j));

        if (m2 < 1) || (n2 < 1) || (m2 >= M) || (n2 >= N)
            B(i, j) = 0;
        else
            a1 = ny1(i, j) - m2;
            b1 = nx1(i, j) - n2;
            B(i, j) = (1 - a1) * (1 - b1) * im(m2, n2) + a1 * (1 - b1) * im(m2 + 1, n2) + (1 - a1) * b1 * im(m2, n2 + 1) + a1 * b1 * im(m2 + 1, n2 + 1);
        end

    end

end

image(B);
colormap(gray(256))
