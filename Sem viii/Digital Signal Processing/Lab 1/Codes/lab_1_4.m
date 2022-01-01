x=linspace(0,100,1000);
f=(x.^2+2.*x+3)./(x+3);
l=tiledlayout(1,1);
title(l,{'Plot for f(x) for 0 \leq x \leq 100','(PUL074BEX007)'})
nexttile
plot(x,f,'Linewidth',1.5)
xlabel('$x$','interpreter','latex')
ylabel ('$f(x)=\frac{x^2+2x+3}{x+3}$','interpreter','latex')
print('lab_1_4','-depsc')