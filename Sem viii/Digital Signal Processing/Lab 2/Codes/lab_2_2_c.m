r=input('Enter the value for r: ');
t=-5:0.01:5;
C=1;
w=pi;
theta=pi;
y=exponential_response_polar(C,r,w,theta,t);
l=tiledlayout(2,1);
title(l,{sprintf('Plot for CT exponential function with r=%d',r),'(PUL074BEX007)'})
nexttile
plot(t,real(y),'Linewidth',1.5)
title('Real part')
ylabel('Real [x(t)]')
xlabel('t','interpreter','latex')
nexttile
plot(t,imag(y),'Linewidth',1.5)
title('Imaginary part')
ylabel('Imag [x(t)]')
xlabel('t','interpreter','latex')
print(sprintf('lab_2_2_c_%d',r),'-depsc')