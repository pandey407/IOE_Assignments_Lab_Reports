t=linspace(0,10,1000);
a=2;
w=5;
y=exponential_cosine(a,w,t);
l=tiledlayout(1,1);
title(l,{'Plot of y for a=2, \omega=5 and t=0:10', '(PUL074BEX007)'})
nexttile
plot(t,y,'Linewidth',1.5)
xlabel('t','interpreter','latex')
ylabel ('$y=e^{-at}\cos(\omega t)$','interpreter','latex')
print('lab_1_2','-depsc')