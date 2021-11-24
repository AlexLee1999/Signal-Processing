X = linspace(-1,1, 20);
r = normrnd(0,0.03,[1,20]);
Y = X + r;
figure(1)
subplot(1,2,1)
stem(Y);
h = zeros(1,11);
C = exp(0)+(exp(-5)+exp(-10)+exp(-15)+exp(-20)+exp(-25))*2;
for n=7:11
    h(1,n)=exp(-(n-6)*5)/C;
    h(1,6-(n-6))=h(1,n);
end
h(1,6) = 1/C;
out=conv(Y, h);
subplot(1,2,2)
stem(out);
