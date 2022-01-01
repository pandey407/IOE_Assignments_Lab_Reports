fc1=10 ;
fc2=30 ;
fp=5 ;
amp=1;
t=0:0.001:1; 
c1=amp.*sin(2*pi*fc1*t);
c2=amp.*sin(2*pi*fc2*t);
%Layout setup
l= tiledlayout(4, 1);
title(l, 'Frequency Shift Keying (PUL074BEX007)')
%Display carrier wave 1
nexttile;
plot(t,c1)
xlabel('Time(Sec)');
ylabel({'Amplitude','(Volts)'});
title('Carrier wave 1')
%Display carrier wave 1
nexttile;
plot(t,c2)
xlabel('Time(Sec)');
ylabel({'Amplitude','(Volts)'});
title('Carrier wave 2')
%Generate amd display digital input signal
m=amp.*square(2*pi*fp*t)+amp;
nexttile;
plot(t,m)
xlabel('Time(Sec)');
ylabel({'Amplitude','(Volts)'});
title('Digital Input Signal')
%FSK modulation
for i=0:1000 
    if m(i+1)==0
        mm(i+1)=c1(i+1);
    else
        mm(i+1)=c2(i+1);
    end
end
%Display FSK modulated signal
nexttile;
plot(t,mm)
xlabel('Time(Sec)');
ylabel({'Amplitude','(Volts)'});
title('BPSK modulated signal coresponding to binary information at the transmitter');
print('-depsc', 'fsk-obs');