function [fig,mlW,slA] = freqRespPlot(H,w,str)
    mag = abs(H);
    magdB = 20 * log10(mag);
    mlW=2*w(find(magdB<max(magdB)-3,1,'first'))/pi;
    pks=findpeaks(magdB,'Threshold',0);
    pks = pks(find(pks < 0, 1, 'first'):end);
    slA=max(pks)-max(magdB);
    fig=figure();
    l = tiledlayout(2, 1);
    nexttile
    plot(w/pi, magdB, 'LineWidth', 1.5)
    grid on
    ylabel('Magnitude (dB)')
    title('Magnitude plot', 'FontWeight', 'normal')
    nexttile
    plot(w/pi, mag, 'LineWidth', 1.5)
    grid on
    ylabel('Gain')
    title('Linearized form', 'FontWeight', 'normal')
    xlabel(l, 'Normalized Frequency (\times \pi rad/sample)')
    title(l, sprintf('Frequency response of %s\n(PUL074BEX007)', str));
end

