dt = .01;
t = 0:dt:100;
n = length(t);
N = zeros(1,n);
x = zeros(1,n-1);

N(1) = 1;

C = 100;

q = [0.1,.2,.5,1];

m = length(q);
for j=1:m
    for i=2:n;
        dN = (q(j)*N(i-1)/C)*(C-N(i-1));
        x(i-1) =dN;
        N(i) = N(i-1) + dt*dN;
    end;
    figure(1);
    plot(t,N);
    hold on;
    figure(2);
    plot(t(1:end-1),x);
    hold on;
end;

legend('0.1','.2','.5','1');