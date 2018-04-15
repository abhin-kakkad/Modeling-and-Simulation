clc;
clear;
lamda=[0.1,0.25,0.5,0.75];
n=10000;
m=50;
%lamda=0.25;
% dt=1;
% t=1:dt:m;
% x=zeros(1,length(t));
% 
% for i=1:length(t)
%     x(1,i)=10000*exp(-lamda*i);
% end;

for k=1:4
    a=ones(1,n);
    b=zeros(1,m);
    for i = 1:m
        for j= 1:n
            y=rand();
            if y<lamda(k)
                a(1,j)=0;
            end;
        end;
        b(1,i)=sum(a);
    end;
    %hold on;
    plot(b);
     hold on;
end;
figure(1);
title('Radioactive Decay for n=10000');
xlabel('Time');
ylabel('Atoms');
legend('lamda=0.1','lamda=0.25','lamda=0.5','lamda=0.75');