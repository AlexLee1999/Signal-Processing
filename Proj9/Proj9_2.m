[nx, ny] = meshgrid([1:512], [1:512]);
im = zeros(512);
rx = 50;
ry = 100;
for i=1:512
    for j=1:512
        if (i-256)^2/rx^2 + (j-128)^2/ry^2 <=1
            im(i, j) = 1;
        end
    end
end
imshow(im)
% L0
L0 = nnz(im)
% L1
L1 = sum(abs(im), 'all')
% L2
L2 = sqrt(sum(im.^2, 'all'))
% L inf
L_inf = max(im,[], 'all')
x_bar = sum(im.*nx, 'all')/sum(im, 'all')
y_bar = sum(im.*ny, 'all')/sum(im, 'all')
% 2, 0
m_20 = sum((nx-x_bar).^2 .*im, 'all')
m_02 = sum((ny-y_bar).^2 .*im, 'all')
m_11 = sum((nx-x_bar).*(ny-y_bar).*im, 'all')


