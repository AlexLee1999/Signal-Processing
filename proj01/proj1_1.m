im=double(imread('/Pic/3.gif'));
A=zeros(512,512);

for m=1:512
    for n=2:512
        A(m,n)=im(m,n)-im(m,n-1);
    end
end
image(A);
colormap(gray(256))