selected_window = input('Enter the type of window: ', 's');
str=sprintf('FIR filter using %s window',selected_window);
wsample = 100;
wp = 15;
ws = 20;
wpn = 2*wp/wsample;
wsn = 2*ws/wsample;
wn = (wpn + wsn)/2;
A = 40;
switch selected_window
    case 'kaiser'
        beta = betaValue(A);
        dw = (wsn - wpn)/2;
        M = ((A-7.95)./(14.36*dw)) + 1;
        M = round(M);
        if(rem(M,2)==0)
            M=M+1;
            N=M-1;
        else
            N=M-1;
        end
        win = kaiser(M,beta);
    case 'hamming'
        M=61;
        N=M-1;
        win=hamming(M);
    otherwise
        error('The window you want is not found.')
end
B = fir1(N,wn,win);
[hFir,wFir] = freqz(B,1,1024);
[f1,mlW,slA]=freqRespPlot(hFir,wFir,str);
fprintf('Parameters for %s:\n',str);
fprintf('Window length: %d\n',M);
fprintf('Main lobe width = %.3f\n',mlW)
fprintf('Relative side lobe attenuation = %.3f\n',slA)
f2=figure();
l=tiledlayout(1,1);
y=impz(B,1);
nexttile
stem(y, 'LineWidth', 1.5)
xlabel('n')
ylabel('Amplitude')
title(l,sprintf('Impulse response of %s\n(PUL074BEX007)',str));
print(f1,sprintf('../Figures/%s-fir', selected_window), '-depsc')
print(f2,sprintf('../Figures/%s-imp', selected_window), '-depsc')
