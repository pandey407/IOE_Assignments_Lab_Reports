t = -5:0.01:5;
C=[1/3 1/2 1/4 1 1/4 1/2 1/3];
y=synthesize_signal(C,t);
l=tiledlayout(1,1);
title(l,{'Signal synthesis from the FS coefficients','(PUL074BEX007)'})
nexttile
plot(t,real(y),'Linewidth',1.5)
xlabel('t','interpreter','latex')
ylabel('Amplitude');
print('lab_2_4','-depsc')
