clc;
clear all;
close all;

tstart = 0;
dt = 0.01;
tend = 30;

t = tstart:dt:tend;

S = zeros(size(t));
I = zeros(size(t));
R = zeros(size(t));

C = 762;
I0 = 1;
alpha = 0.5;
beta = 0.00218;

S(1) = C;
I(1) = 1;
R(1) = 0;

ep_end = 0;

for i=2:length(t)
    S(i) = S(i-1) - beta*I(i-1)*S(i-1)*dt;
    I(i) = I(i-1) + (beta*I(i-1)*S(i-1) - alpha*I(i-1))*dt;
    if(I(i)<0.5 && ep_end==0)
        ep_end = t(i);
    end
    R(i) = R(i-1) + alpha*I(i-1)*dt;
end

disp(max(I));
disp(ep_end);

figure(1)
plot(t,S);
hold on
plot(t,I,'r--');
hold on
plot(t,R,'g');
title('SIR Model');
xlabel('Time t(in days)');
ylabel('Population');
legend('Susceptible ', 'Infected ', 'Recovered ');