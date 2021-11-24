im=double(imread('../Pic/3.gif'));
[M, N] = size(im);
a = 1;
b = 100;
B = zeros(a*M, b*N);
for i=1:a*M
    for j=1:b*N
       m1 = i/a;
       n1 = j/b;
       m2 = floor(m1);
       n2 = floor(n1);
       if (m2 < 1)
           m2 = 1;
       end
       if (n2 < 1)
           n2 = 1;
       end
       if (m2 >= M)
           m2 = M-1;
       end
       if (n2 >= N)
           n2 = N-1;
       end
       a1 = m1 - m2;
       b1 = n1 - n2;
       B(i, j)=(1-a1)*(1-b1)*im(m2, n2)+a1*(1-b1)*im(m2+1, n2)+(1-a1)*b1*im(m2, n2+1)+a1*b1*im(m2+1, n2+1);
    end
end
image(B);
colormap(gray(256))