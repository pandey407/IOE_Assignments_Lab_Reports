x=0;
t=-10:0.01:10;
a=40;
w=5;
n=input('Enter the value of n\n');
for i=1:2:n
    x=x+(4*(a/pi))*(sin(i*w*t)*1/i);
end
plot(t,x)
xlabel('t');
ylabel('x(t)');
title('Fourier Series Representation of a Square Wave');
