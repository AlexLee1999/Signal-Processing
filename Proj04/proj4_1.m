figure(1)
t = [0:0.3:2 * pi];
x1 = sin(t);
x2 = linspace(-1, 1, 20);
x3 = linspace(1, -1, 20);
x4 = ones(1, 20);
x = [x4, x2, x3, x1, zeros(1, 19)];
subplot(1, 2, 1)
stem(x);
h = x2;
h1 = h(20:-1:1);
[m, n] = size(x);
y = zeros(1, n - 20);

for i = 1:n - 20
    sum = 0;

    for j = i + 1:i + 20
        a = (x(1, j))^2;
        sum = sum + a;
    end

    sum1 = 0;
    sum2 = 0;

    for k = 1:20
        sum1 = sum1 + (h1(k))^2;
        sum2 = sum2 + (x(i + k) * h1(k));
    end

    y(i) = sum2 / sqrt(sum * sum1);
end

subplot(1, 2, 2);
stem(y)
