im = double(imread('/Pic/3.gif'));
tic
[M, N] = size(im);
A = zeros(512, 512);
A = 2 * im([1, 1:M - 1], [1, 1:N - 1]) - 2 * im([2:M, M], [2:N, N]) + im([1, 1:M - 1], :) - im([2:M, M], :) + im(:, [1, 1:N - 1]) - im(:, [2:N, N]);
A = A / 4;
% for m=2:M-1
%     for n=2:N-1
%         A(m,n)=(2.*im(m-1, n-1)- 2.*im(m+1, n+1)+im(m-1, n)-im(m+1, n)+im(m, n-1)-im(m, n+1))./4;
%     end
% end
toc
image(abs(A) / max(max(abs(A))) * 510);
colormap(gray(256))
