fm=input('Enter message frequency :');
fc=input('Enter carrier frequency :');
fs=input('Enter sampling frequency :');
t=0:(1/fs):((4/fm)-(1/fs));
x=cos(2*pi*fm*t);