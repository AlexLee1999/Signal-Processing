im1=double(imread('/Pic/1.gif'));
im2=double(imread('/Pic/2.gif'));
a=0;
[M,N]=size(im1);
for m=1:M
    for n=1:N
        a=a+(im1(m,n)-im2(m,n))^2;
    end
end
a=a/(M*N);
c=10*log10(255^2/a);
disp(c);