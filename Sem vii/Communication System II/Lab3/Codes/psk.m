%Generate digital input signal
bitgenerator;
t1 = Tb/nb:Tb/nb:nb*N*(Tb/nb);
%Layout setup
l= tiledlayout(3, 1);
title(l, 'Binary Phase Shift Keying (PUL074BEX007)')
%Display digital input signal
nexttile;
plot(t1,bit,'lineWidth',2.5);
grid on;
axis([0 Tb*N -0.5 1.5]);
xlabel('Time(Sec)');
ylabel({'Amplitude','(Volts)'});
title('Digital Input Signal');
%BPSK modulation
A=5; 
br = 1/Tb;
fc = br; 
t2 = Tb/nb:Tb/nb:Tb;
mod = [];
kl=[];
for i=1:1:N
    wave=A*sin(2*pi*fc*t2);
    kl=[kl wave];
end
for i=1:1:N
    if (x(i)==1)
        y=A*sin(2*pi*3*fc*t2);
    else
        y=A*sin(2*pi*3*fc*t2+pi);
    end
mod = [mod y];
end
t3 = Tb/nb:Tb/nb:Tb*N; 
%Display carrier signal
nexttile;
plot(t3,kl);
grid on;
xlabel('Time(sec)');
ylabel({'Amplitude','(Volts)'});
title('Carrier Signal');
%Display BPSK modulated signal
nexttile;
plot(t3,mod);
grid on;
xlabel('Time(Sec)');
ylabel({'Amplitude','(Volts)'});
title('BPSK modulated signal coresponding to binary information at the transmitter');
print('-depsc', 'psk-obs');