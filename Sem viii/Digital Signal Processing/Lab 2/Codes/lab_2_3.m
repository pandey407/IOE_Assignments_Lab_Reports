n=-5:5;
a=2;
theta=pi;
y=exponential_response_dt(a,theta,n);
l=tiledlayout(2,1);
title(l,{'Plot for DT exponential function','(PUL074BEX007)'})
nexttile
stem(n,abs(y),'Linewidth',1.5)
title('Magnitude')
ylabel('Magnitude of x[n]')
xlabel('n','interpreter','latex')
nexttile
stem(n,angle(y)*180/pi,'Linewidth',1.5)
title('Phase')
yticks([-180 0 180])
ylim([-180 180])
ylabel('Phase of x[n] in degree')
xlabel('n','interpreter','latex')
print('lab_2_3','-depsc')
