im=double(imread('../Pic/3.gif'));
k1 = zeros(512,512);
H = zeros(512,512);
s=0;
C=0.01;
for i=-5:5
    for j=-5:5
        s = s + exp(-0.3*(i^2+j^2));
    end
end
for i=1:11
    for j=1:11
        k1(i,j)=s*exp(-0.1*((i-1)^2+(j-1)^2));
    end
end
for i=1:10
    for j=1:11
        k1(513-i,j)=s*exp(-0.1*((i)^2+(j-1)^2));
    end
end
for i=1:11
    for j=1:10
        k1(i,513-j)=s*exp(-0.1*((i-1)^2+(j)^2));
    end
end
for i=1:10
    for j=1:10
        k1(513-i,513-j)=s*exp(-0.1*((i)^2+(j)^2));
    end
end
k_fft = fft2(k1);
im_fft = fft2(im);
Y=im_fft* k_fft;
y=ifft2(Y);
y=y+rand(512);
image(y);
colormap(gray(256))
for i=1:512
    for j=1:512
        H(i,j)=1/(C/conj(k_fft(i,j))+k_fft(i,j));
    end
end
X = y*H;
x = ifft2(X);
image(x);
colormap(gray(256))