%Generate digital input signal
M=256;
nbit=64;
msg=randi([0,1],1,nbit);
x=msg;
Tb=0.1; 
N = length(x);
nb = 100;
bit = [];
for n = 1:N
    if x(n) == 1
        sig = ones(1,nb);
    else 
        sig = zeros(1,nb);
    end
    bit = [bit sig];
end
t1 = Tb/nb:Tb/nb:nb*N*(Tb/nb);
%Layout setup
l= tiledlayout(3, 1);
title(l, 'Quadrature Amplitude Modulation (PUL074BEX007)')
%Display digital input signal
nexttile;
plot(t1,bit,'lineWidth',2.5);
grid on;
axis([0 Tb*N -0.5 1.5]);
xlabel('Time(Sec)');
ylabel({'Amplitude','(Volts)'});
title('Digital Input Signal');
%Reshape message into matrix 
msg_reshape=reshape(msg,log2(M),nbit/log2(M))';
disp('Information reshaped as:');
disp(msg_reshape);
%Convert binary rows to decimal
for j=1:nbit/log2(M)
    for i=1:log2(M)
        a(j,i)=num2str(msg_reshape(j,i));
    end
end
as=bin2dec(a);
%Display serial symbol
nexttile;
stem(as);
xlabel('n(discrete time)');
ylabel({'Amplitude','(Volts)'});
title('Serial symbol for M-ary QAM modulation at transmitter');
%QAM modulation
p=qammod(as,M);
RR=real(p);
II=imag(p);
sr=1/Tb;
f=sr*5;
t=Tb/nb:Tb/nb:Tb;
mod=[];
for k=1:1:length(RR)
    yr=RR(k)*cos(2*pi*f*t);
    yim=II(k)*sin(2*pi*f*t);
    y=yr+yim;
    mod=[mod y];
end
t3 = Tb/nb:Tb/nb:Tb*length(RR);
%Display QAM modulated signal
nexttile;
plot(t3,mod);
xlabel('Time(Sec)');
ylabel({'Amplitude','(Volts)'});
title('QAM modulated signal coresponding to binary information at the transmitter');
print('-depsc', 'qam-obs');