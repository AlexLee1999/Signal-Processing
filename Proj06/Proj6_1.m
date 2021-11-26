im = double(imread('../Pic/3.gif'));
k1 = zeros(512, 512);
H = zeros(512, 512);
s = 0;
C = 0.03;

for i = -10:10

    for j = -10:10
        s = s + exp(-0.02 * (i^2 + j^2));
    end

end

[xx, yy] = meshgrid([-10:10], [-10:10]);
k = (1 / s) * exp(-0.02 * (xx.^2 + yy.^2));

for i = 1:11

    for j = 1:11
        k1(i, j) = (1 / s) * exp(-0.02 * ((i - 1)^2 + (j - 1)^2));
    end

end

for i = 1:10

    for j = 1:11
        k1(513 - i, j) = (1 / s) * exp(-0.02 * ((i)^2 + (j - 1)^2));
    end

end

for i = 1:11

    for j = 1:10
        k1(i, 513 - j) = (1 / s) * exp(-0.02 * ((i - 1)^2 + (j)^2));
    end

end

for i = 1:10

    for j = 1:10
        k1(513 - i, 513 - j) = (1 / s) * exp(-0.02 * ((i)^2 + (j)^2));
    end

end

k_fft = fft2(k1);
im_fft = fft2(im);
% Y=im_fft.* k_fft;  % .*
% y=ifft2(Y);
y = conv2(im, k, 'same') + (rand(512) - 0.5) * 10;
% for i=1:512
%     for j=1:512
%         y(i,j)=abs(y(i,j));
%     end
% end
figure(1)
image(abs(y));
colormap(gray(256))

for i = 1:512

    for j = 1:512
        H(i, j) = 1 / (C / conj(k_fft(i, j)) + k_fft(i, j));
    end

end

X = fft2(y) .* H; %
x = ifft2(X);
figure(2)
image(real(x));
colormap(gray(256))
