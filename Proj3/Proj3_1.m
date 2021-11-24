X = zeros(20, 1);
X([5: 10])= 1;
r = normrnd(0,0.03,[20,1]);
Y = X + r;
figure(1)
subplot(1,2,1)
stem(Y);
h = zeros(11,1);
C = exp(-5)+exp(-10)+exp(-15)+exp(-20)+exp(-25);
for n=7:11
    h(n,1)=exp(-(n-6)*5)/C;
    h(6-(n-6),1)=-h(n,1);
end
out=conv(Y, h,'same');
subplot(1,2,2)
stem(out);
