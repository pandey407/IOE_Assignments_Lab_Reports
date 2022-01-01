basic_plot_name=input('Enter function you want to plot: ','s');
n=-5:5;
t=-5:0.01:5;
y=basic_plot_selector(basic_plot_name,t);
z=basic_plot_selector(basic_plot_name,n);
l=tiledlayout(2,1);
title(l,{sprintf('%s',['Plot for ',basic_plot_name, ' function']),'(PUL074BEX007)'})
nexttile
plot(t,y,'LineWidth',1.5)
xlabel('t','interpreter','latex')
ylabel('y(t)','interpreter','latex')
title('Continuous Time Function')
nexttile
stem(n,z,'Linewidth', 1.5)
xlabel('n','interpreter','latex')
ylabel('y[n]','interpreter','latex')
title('Discrete Time Function')
print(basic_plot_name,'-depsc')
