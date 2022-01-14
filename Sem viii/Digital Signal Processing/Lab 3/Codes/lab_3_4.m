t=linspace(-100,100,1000);
x=t>=1;
tau=double(input('Enter value of τ: '));
Tp=50;
h=2*tau/Tp.*sinc(t.*2*tau/Tp);
y=conv(x,h,'same');
l=tiledlayout(1,1);
title(l,{'Response of LTI system with sinc function as impulse response',sprintf('for τ=%d',tau),'(PUL074BEX007)'})
nexttile
plot(t,y,'Linewidth', 1.5)
xlabel('x')
ylabel('y(t)')
print('../Figures/lab_3_4_ml','-depsc')