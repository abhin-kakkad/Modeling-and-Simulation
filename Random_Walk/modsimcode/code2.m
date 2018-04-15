dt=.1;
t = 0:dt:100;
n= length(t);
mn = zeros(1,n);
msd = zeros(1,n);

p=.3;
q=1-p;
a = zeros(1,n);
count=0;
m = 100;
mn = zeros(1,m);
msd = zeros(1,m);

for j=1:m;
    count=0;
for i=1:n
    x = rand();
    if x<p;
        count=count+1;
        mn(j) = mn(j)+1;
    else
        count=count-1;
        mn(j) = mn(j) - 1;
    end;
    a(1,i) = count;
end;
    mn(j) = mean(a);
    msd(j) = mean(a.^2);
end;

mean(mn)
mean(msd)
    
plot(a);