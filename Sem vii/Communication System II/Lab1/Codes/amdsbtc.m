Ashlesh_setup;
y_under=modulate(x, fc, fs, 'amdsb-tc', -1/0.5);
y_normal=modulate(x, fc, fs, 'amdsb-tc', -1/1);
y_over=modulate(x, fc, fs, 'amdsb-tc', -1/2);
%Plotting signals as tiles
l=tiledlayout(2,3);
nexttile([1 , 3])
plot(t,x);
title('Message signal');
xlabel({'Time','(in second)'});
ylabel('Amplitude');
nexttile
plot(t,y_under);
title('Under modulated signal','m<1');
xlabel({'Time','(in second)'});
ylabel('Amplitude');
nexttile
plot(t,y_normal);
title('Normal modulated signal','m=1');
xlabel({'Time','(in second)'});
ylabel('Amplitude');
nexttile
plot(t,y_over);
title('Over modulated signal','m>1');
xlabel({'Time','(in second)'});
ylabel('Amplitude');
%Tiledlayout title and figure print
title(l,'AMDSB-TC modulation (PUL074BEX007)');
print('dsbtc','-depsc');