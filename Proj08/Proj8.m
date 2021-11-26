im = double(imread('../Pic/3.gif'));
[M, N] = size(im);
x = conv2(im, [-1, 0, 1], 'same');
y = conv2(im, [-1, 0, 1]', 'same');
w = zeros(11);

for i = 1:11

    for j = 1:11
        w(i, j) = exp(- ((i - 6)^2 + (j - 6)^2) / (2 * 0.09));
    end

end

A = conv2(x.^2, w, 'same');
B = conv2(y.^2, w, 'same');
C = conv2(x .* y, w, 'same');
R = A .* B - C.^2 - 0.05 .* (A + B).^2;
R1 = max(max(R(:, [1, 1:end - 1]), R(:, [2:end, end])), R);
R2 = max(max(R1([1, 1:end - 1], :), R1([2:end, end], :)), R1);
[cx, cy] = find((R == R2) & (R > max(max(R)) * 0.01));
image(im);
colormap(gray(256))
hold on
plot(cy, cx, '*')
hold off
%
% for i=2:M-1
%     for j=2:N-1
%         if R(i, j)>R(i+1, j+1)&&R(i, j)>R(i-1, j+1)&&R(i, j)>R(i+1, j-1)&&R(i, j)>R(i-1, j-1)
