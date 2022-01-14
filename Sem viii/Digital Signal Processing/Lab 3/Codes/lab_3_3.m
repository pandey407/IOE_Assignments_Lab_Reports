n1=0:4;
x=n1>=0&n1<=4;
n2=0:6;
h=(n2>=0&n2<=6).*(2.^n2);
nmin=min(min(n1),min(n2));
nx=length(x);
nh=length(h);
n=nmin:nx+nh+nmin-2;
y=conv(x,h);
l=tiledlayout(1,1);
title(l,{'Response of LTI system','(PUL074BEX007)'})
nexttile
stem(n,y,'Linewidth',1.5)
xlabel('n')
ylabel('y[n]')
print('../Figures/lab_3_3_ml','-depsc')