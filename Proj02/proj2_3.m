im1 = double(imread('/Pic/1.gif'));
im2 = double(imread('/Pic/2.gif'));
a = 0;
b = 0;
[M, N] = size(im1);
c = sum(sum((im1 - im2).^2)) / sum(sum((im1).^2))
% for m=1:M
%     for n=1:N
%         a=a+(im1(m,n)-im2(m,n))^2;
%         b=b+im1(m,n)^2;
%     end
% end
% c=sqrt(a/b);
% disp(c);
