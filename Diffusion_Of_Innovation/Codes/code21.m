dt = .1;
t = 0:dt:600;
x = 0.5;
a = 20+ 50./(1+exp(-x*(t-300)));
plot(t,a);


n = length(t);
xx = zeros(1,n-1);

N = zeros(1,n);
alpha = .05;

N(1) = 1;
for i=2:n;
    dN = alpha*N(i-1)*(1 - N(i-1)/a(i));
    xx(i-1) = dN;
    N(i) = N(i-1) + dt*dN;
end;

plot(t,N);
figure(2);
plot(t(1:end-1),xx);
