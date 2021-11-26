x = [10, 10, 10, 10, 10, 10, 10, -10, -10, -10, -10, -10, -10, -10] + (rand(1, 14) - 0.5);
subplot(1, 2, 1);
plot(x)
sig1 = 0.1;
sig2 = 0.2;
c = zeros(14);
y = zeros(1, 14);

for i = 1:14
    sum = 0;

    for j = 1:14
        sum = sum + exp(-1 * sig1 * (j - i)^2 - sig2 * (x(j) - x(i))^2);
    end

    c(i) = 1 / sum;
end

for i = 1:14
    sum = 0;

    for j = 1:14
        sum = sum + x(j) * exp(-1 * sig1 * (j - i)^2 - sig2 * (x(j) - x(i))^2);
    end

    y(1, i) = c(i) * sum;
end

subplot(1, 2, 2);
plot(y)
