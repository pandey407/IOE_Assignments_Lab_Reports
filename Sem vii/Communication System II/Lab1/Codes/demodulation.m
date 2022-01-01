Ashlesh_setup;
y=modulate(x, fc, fs, 'amdsb-sc');
z=demod(y,fc,fs,'amdsb-sc');
%Plotting signals as tiles
l=tiledlayout(3,1);
nexttile
plot(t,x);
title('Message signal');
xlabel({'Time','(in second)'});
ylabel('Amplitude');
nexttile
plot(t,y);
title('Modulated signal');
xlabel({'Time','(in second)'});
ylabel('Amplitude');
nexttile
plot(t,z);
title('Demodulated signal');
xlabel({'Time','(in second)'});
ylabel('Amplitude');
%Tiledlayout title and figure print
title(l,'DSB-SC demodulation (PUL074BEX007)')
print('demod','-depsc');