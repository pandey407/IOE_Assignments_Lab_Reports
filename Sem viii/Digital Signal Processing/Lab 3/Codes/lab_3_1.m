x=[1,1,1,1,1];
n1=[-2,-1,0,1,2];
h=[1,0,0,0,0,0,0,0,0,0];
n2=[-4,-3,-2,-1,0,1,2,3,4,5];
nmin=min(min(n1),min(n2));
nx=length(x);
nh=length(h);
n=nmin:nx+nh+nmin-2;
y=zeros(1,length(n));
prod=x'.*h;
for i = 1:nx
    y(i:i+nh-1)=y(i:i+nh-1)+prod(i,:);
end
l=tiledlayout(1,1);
title(l,{'Convolution using basic convolution formula','(PUL074BEX007)'})
nexttile
stem(n,y,'Linewidth',1.5)
xlabel('n')
ylabel('Value')
print('../Figures/lab_3_1_ml','-depsc')