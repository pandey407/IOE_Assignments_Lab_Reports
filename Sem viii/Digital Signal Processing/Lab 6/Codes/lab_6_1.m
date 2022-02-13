f = [0 pi/6 pi/6 pi];
H = [1 1 0 0];
selected_window = input('Enter the type of window: ', 's');
M = input('Enter the value of M: ');
N = M-1;
w = 0:pi/N:pi;
h = window_selector(M,selected_window);
f1=figure();
l=tiledlayout(1,1);
nexttile
plot(w/pi,h,'LineWidth', 1.5);
ylabel('Amplitude')
xlabel('Normalized Samples')
title(l,sprintf('%d-point symmetric %s window',M,selected_window));
[hWindow,wWindow] = freqz(h,1,1024);
f2=freqRespPlot(hWindow,wWindow,sprintf('%s window function',selected_window));
B = fir1(N,1/6,h); 
[hFir,wFir] = freqz(B,1,1024);
[f3,mlWF,slAF]=freqRespPlot(hFir,wFir,sprintf('FIR filter using %s window',selected_window));
fprintf('Parameters for %s:\n',sprintf('FIR filter using %s window',selected_window));
fprintf('Main lobe width = %.3f\n',mlWF)
fprintf('Relative side lobe attenuation = %.3f\n',slAF)
print(f1,sprintf('../Figures/%d-%s',M, selected_window), '-depsc')
print(f2,sprintf('../Figures/%d-%s-resp',M, selected_window), '-depsc')
print(f3,sprintf('../Figures/%d-%s-fir',M, selected_window), '-depsc')