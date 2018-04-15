n = 100;

count=0;

m=1000;
a = zeros(1,m);

for j=1:m
    count=0;
    for i=1:n;
        x = rand();
        if x<.5;
            count=count+1;
        else
            count=count-1;
        end;
    end;
    a(j) = count;
end;
figure(1);
histogram(a,20);
ylabel('Frequency for particular site after n time steps');
xlabel('site(m)');
    