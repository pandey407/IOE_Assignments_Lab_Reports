t=-10:0.01:10;
y=zeros(size(t));
y(t>=0)=1;
subplot(2,1,1);
plot(t,y);
xlabel('t');
ylabel('y(t)');
title('Continuous Unit Step Function');
subplot(2,1,2);
hold on;
for n=-10:10
    if(n<0)
        stem(n,0);
    else
        stem(n,1);
    end
end
xlabel('n');
ylabel('y[n]');
title('Discrete Unit Step Function');
hold off;