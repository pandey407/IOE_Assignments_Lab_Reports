t=-10:0.01:10;
n=-10:10;
c = input('Enter the value of c\n');
a= input('Enter the value of a\n');
y=power(c, a*t);
z=power(c, a*n);
subplot(2,1,1);
plot(t,y);
xlabel('t');
ylabel('y(t)');
title('Continuous Signal y(t)=c^{at}');
subplot(2,1,2);
stem(n,z);
xlabel('n');
ylabel('y[n]');
title('Discrete Signal y[n]=c^{an}');
