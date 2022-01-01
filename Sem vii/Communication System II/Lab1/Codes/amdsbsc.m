Ashlesh_setup;
y=modulate(x, fc, fs, 'amdsb-sc');
z=abs(fft(y,1024));
f= (-511*fs/1024):(fs/1024):(512*fs/1024);
%Plotting signals as tiles
l=tiledlayout(2,2);
nexttile([1 , 2])
plot(t,x);
title('Message signal');
xlabel({'Time','(in second)'});
ylabel('Amplitude');
nexttile
plot(t,y);
title('Modulated signal','Time Domain');
xlabel({'Time','(in second)'});
ylabel('Amplitude');
nexttile
plot(f,z);
title('Modulated signal','Frequency Domain');
xlabel({'Frequency','(in Hz)'});
ylabel('Spectrum amplitude');
%Tiledlayout title and figure print
title(l,'AMDSB-SC modulation (PUL074BEX007)')
print('dsbsc','-depsc');