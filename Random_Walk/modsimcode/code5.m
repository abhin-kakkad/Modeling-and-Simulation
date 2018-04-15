dt=1;
t = 0:dt:1000;    
n= length(t);     %time period

m =  100;
mm = 100;
mn = zeros(mm,n);
msd = zeros(mm,n);
fmn = zeros(1,n);
fmsd = zeros(1,n);

for k=1:mm
a(1) = 0;
meann = 0;
mstd = 0;
a = zeros(1,n);

for i=2:n;
    count=zeros(1,m);
for j=1:m
    x = normrnd(0,1);
    count(j)=count(j)+x;  
end;
    mean(count);
      a(i) = a(i-1) + mean(count);
   meann = meann + a(i);
   mn(k,i) = meann/i;
   
   mstd = mstd + a(i).^2;
   msd(k,i) = mstd/i;
    
end;
end;

for i=1:n
    fmn(1,i) = mean(mn(:,i));
    fmsd(1,i) = mean(msd(:,i));
end;

plot(t,fmsd);
