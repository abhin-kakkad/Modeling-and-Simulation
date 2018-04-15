clc;
clear all;
close all;

tstart = 0;
dt = 0.01;
tend = 25;

t = tstart:dt:tend;
d = 3;

S = zeros(size(t));
I = zeros(size(t));
R = zeros(size(t));
V = zeros(size(t));
vac_flag = zeros(size(t));
temp = zeros(1,length(t)+d/dt);

index = 0;
for i=1:length(t)
    if t(i)==index
        vac_flag(i) = 1;
        index = index+1;
    end
end

C = 762;
I0 = 1;
alpha = 0.5;
beta = 0.00218;
vac_rate = [0.1, 0.15, 0.2];
plot_line = ['g', 'r', 'b'];

for j = 1:length(vac_rate)  
    S(1) = C;
    I(1) = 1;
    R(1) = 0;

    ep_end = 0;
    delay = d/dt - 1;

    for i=2:length(t)
        S(i) = S(i-1) - beta*I(i-1)*S(i-1)*dt;
        if t(i)>=3
            S(i) = S(i) - vac_flag(i-1)*temp(i-1)*S(i-1)/S(i-1-delay);
        end
        temp(i+delay) = vac_flag(i-1)*vac_rate(j)*S(i-1);
        I(i) = I(i-1) + (beta*I(i-1)*S(i-1) - alpha*I(i-1))*dt;
        if(I(i)<0.5 && ep_end==0)
            ep_end = t(i);
        end
        V(i) = V(i-1);
        if t(i)>=3
            V(i) = V(i) + vac_flag(i-1)*temp(i-1)*S(i-1)/S(i-1-delay);
        end
        R(i) = R(i-1) + alpha*I(i-1)*dt;
    end

    disp(max(I));
    disp(ep_end);

    figure(1)
    plot(t,S,plot_line(j));
    hold on
    figure(2)
    plot(t,I,plot_line(j));
    hold on
    figure(3)
    plot(t,R,plot_line(j));
    hold on
    figure(4)
    plot(t,V,plot_line(j));
    hold on
end

figure(1)
title('Effects of different vaccinated rates on Susceptible people ');
xlabel('Time t(in days)');
ylabel('Population');
legend(num2str(vac_rate(1)), num2str(vac_rate(2)), num2str(vac_rate(3)));

figure(2)
title('Effects of different vaccinated rates on Infected people ');
xlabel('Time t(in days)');
ylabel('Population');
legend(num2str(vac_rate(1)), num2str(vac_rate(2)), num2str(vac_rate(3)));

figure(3)
title('Effects of different vaccinated rates on Recovered people ');
xlabel('Time t(in days)');
ylabel('Population');
legend(num2str(vac_rate(1)), num2str(vac_rate(2)), num2str(vac_rate(3)));

figure(4)
title('Effects of different vaccinated rates on Vaccinated people ');
xlabel('Time t(in days)');
ylabel('Population');
legend(num2str(vac_rate(1)), num2str(vac_rate(2)), num2str(vac_rate(3)));
