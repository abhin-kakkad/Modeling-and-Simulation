n = 1000;
dt = 1;
x = zeros(1,n);
t = 1:dt:n;
count = 0;
x(1) = 0;
current_mean = zeros(1,n);
current_msd = zeros(1,n);
temp_mean = 0;
temp_msd = 0;
for i=2:n
    temp = normrnd(0,1);
    x(i) = x(i-1) + temp;
    current_mean(i) = x(i)/(i-1);
    temp_msd = temp_msd + x(i).^2;
    current_msd(i) = temp_msd/(i-1);
end;

figure(1);
plot(t,current_mean);
figure(2);
plot(t,current_msd);

