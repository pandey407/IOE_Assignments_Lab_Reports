%Generate digital input signal
bitgenerator; 
t1 = Tb/nb:Tb/nb:nb*N*(Tb/nb);
%Layout setup
l= tiledlayout(2, 1);
title(l, 'Amplitude Shift Keying (PUL074BEX007)')
%Display digital input signal
nexttile;
plot(t1,bit,'lineWidth',2.5);
grid on;
axis([0 Tb*N -0.5 1.5]);
xlabel('Time(Sec)');
ylabel({'Amplitude','(Volts)'});
title('Digital Input Signal');
%ASK modulation
Ac1 = 12; 
Ac2 = 0; 
br = 1/Tb;
fc = br*10; 
t2 = Tb/nb:Tb/nb:Tb;
mod = [];
for i = 1:1:N
    if x(i) == 1
        y = Ac1*cos(2*pi*fc*t2); 
    else
        y = Ac2*cos(2*pi*fc*t2); 
    end
    mod = [mod y];
end
t3 = Tb/nb:Tb/nb:Tb*N; 
%Display ASK modulated signal
nexttile;
plot(t3,mod);
xlabel('Time(Sec)');
ylabel({'Amplitude','(Volts)'});
title('ASK modulated signal coresponding to binary information at the transmitter');
print('-depsc', 'ask-obs');