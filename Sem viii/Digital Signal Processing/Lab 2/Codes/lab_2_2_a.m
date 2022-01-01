t=-5:0.01:5;
C=1;
a=1;
y1=exponential_response_ct(C,a,t);
C=-1;
a=-1;
y2=exponential_response_ct(C,a,t);
l=tiledlayout(2,1);
title(l,{'Plot for continuous time exponential function', '(PUL074BEX007)'})
nexttile
plot(t,y1,'Linewidth',1.5)
title('For C and a both positive')
xlabel('t','interpreter','latex')
ylabel('y(t)','interpreter','latex')
nexttile
plot(t,y2,'Linewidth',1.5)
title('For C and a both negative')
xlabel('t','interpreter','latex')
ylabel('y(t)','interpreter','latex')
print('lab_2_2_a','-depsc');