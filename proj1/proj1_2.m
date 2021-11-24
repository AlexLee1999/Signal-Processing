im=double(imread('/Pic/3.gif'));
A=zeros(512,512);

for m=2:512
    for n=1:512
        A(m,n)=im(m-1,n)-im(m,n);
    end
end
image(A);
colormap(gray(256))