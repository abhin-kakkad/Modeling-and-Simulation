n = 1000;
dt = 1;
x = zeros(1,n);
t = 1:dt:n;
count = 0;
trials = 100;
current_mean = zeros(trials+1,n);
current_msd = zeros(trials+1,n);
temp_mean = 0;
temp_msd = 0;


for j=1:trials
    x = zeros(1,n);
    temp_mean = 0;
    temp_msd = 0;
    for i=2:n
        temp = normrnd(5,3);
        x(i) = x(i-1) + temp;
        current_mean(j,i) = x(i)/(i-1);
        temp_msd = temp_msd + x(i).^2;
        current_msd(j,i) = temp_msd/(i-1);
    end;
end;

current_mean(trials+1,:) = mean(current_mean(1:trials,:));
current_msd(trials+1,:) = mean(current_msd(1:trials,:));


figure(1);
plot(t,current_mean(trials+1,:));
ylabel('Mean of Random Walks');
xlabel('Ensemble Size');

title('Mean Of Random Walks for n = 1000 with different ensemble size for p~N(5,3)');

figure(2);
plot(t,current_msd(trials+1,:));
ylabel('MSD of Random Walks');
xlabel('Ensemble Size');

title('Mean Squared Displacement of Random Walks for n = 1000 with different ensemble size for p~N(5,3)');


