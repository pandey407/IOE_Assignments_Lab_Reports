x=[1,0,-1,1,2,1];
n1=[-2,-1,0,1,2,3];
h=[1,1,1,1,1];
n2=[0,1,2,3,4];
nmin=min(min(n1),min(n2));
nx=length(x);
nh=length(h);
n=nmin:nx+nh+nmin-2;
y_graphical=zeros(1,length(n));
[x_folded,n_folded]=sigfold(x,n1);
temp=1;
for i=n
    [x_shift,n_shift]=sigshift_m(x_folded,n_folded,i);
    [x_multi,n_multi]=sigmulti(x_shift,n_shift,h,n2);
    for j=1 :length(n_multi)
        y_graphical(temp)=y_graphical(temp)+x_multi(j);
    end
    temp=temp+1; 
end
y_tabular=zeros(1,length(n));
prod=x'.*h;
for i = 1:nx
    y_tabular(i:i+nh-1)=y_tabular(i:i+nh-1)+prod(i,:);
end
y_conv=conv(x,h);
l=tiledlayout(3,1);
title(l,{'Example convolution from labsheet','(PUL074BEX007)'})
xlabel(l,'n')
ylabel(l,'Value')
nexttile
stem(n,y_graphical,'Linewidth',1.5)
title('Graphical method')
nexttile
stem(n,y_tabular,'Linewidth',1.5)
title('Tabular method')
nexttile
stem(n,y_conv,'Linewidth',1.5)
title('Conv function')
print('../Figures/lab_3_example_all','-depsc')