clear all;
n = [10,100,1000,10000];
m=101;
lamda = .1;

b = zeros(1,m);

for k=1:4
    a = ones(1,n(k));
    t = 0:m-1;
    c = n(k)*exp(-lamda*t);
    b(1) = n(k);
    
for i=2:m
    for j=1:n(k)
        x = rand();
        if x<lamda
            a(1,j) = 0;
        end;
    end;
    b(1,i) = sum(a);
end;

figure(k);
plot(t,b);
hold on;
plot(t,c);
title('Radioactive atoms remaining in substance vs time' )
xlabel('time')
ylabel('Number of atoms')
legend('Probability model','differential model');
end;
