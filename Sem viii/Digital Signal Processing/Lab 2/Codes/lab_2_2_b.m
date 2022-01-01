t=-5:0.01:5;
C=1;
a=1i;
y=exponential_response_ct(C,a,t);
l=tiledlayout(2,1);
title(l,{'Plot for continuous time exponential function', 'with a as pure imaginary number','(PUL074BEX007)'})
nexttile
plot(t,real(y),'Linewidth',1.5)
title('Real part')
ylabel('Real [x(t)]')
xlabel('t')
nexttile
plot(t,imag(y),'Linewidth',1.5)
title('Imaginary part')
ylabel('Imag [x(t)]')
xlabel('t')
print('lab_2_2_b','-depsc')