n1=0:6;
x=n1./3;
n2=-2:2;
h=n2 >= -2 & n2 <= 2;
nmin=min(min(n1),min(n2));
nx=length(x);
nh=length(h);
n=nmin:nx+nh+nmin-2;
y=conv(x,h);
l=tiledlayout(1,1);
title(l,{'DT convolution using conv function','(PUL074BEX007)'})
nexttile
stem(n,y,'Linewidth',1.5)
xlabel('n')
ylabel('Value')
print('../Figures/lab_3_2_a_ml','-depsc')