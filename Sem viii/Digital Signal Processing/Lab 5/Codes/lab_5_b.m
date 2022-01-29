selected_filter = input('Enter the filter type: ', 's');
Rp = 0.5;
Rs = 40;
fs = 8000;
fn = fs / 2;
wp = 1200 / fn;
ws = 2000 / fn;
[N, wc, b_digital, a_digital] = filter_selector(wp, ws, Rp, Rs, selected_filter);
[H_digital, w_digital] = freqz(b_digital, a_digital);
mag = abs(H_digital);
magdB = 20 * log10(mag);
phase = angle(H_digital) * 180 / pi;
fprintf('Order of %s filter=%d\n',selected_filter,N)
l = tiledlayout(2, 2);
nexttile([1 1])
plot(w_digital / pi, magdB, 'LineWidth', 1.5)
grid on
xline(wc, 'g--', sprintf('\\omega_c=%.2f', wc), 'LineWidth', 1, 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'left')
yline(max(magdB) - 3, 'r--', sprintf('K_c=%.2f', max(magdB) - 3), 'LineWidth', 1, 'LabelVerticalAlignment', 'bottom', 'LabelHorizontalAlignment', 'right')
ylabel('Magnitude (dB)')
title('Magnitude plot', 'FontWeight', 'normal')
nexttile([2 1])
plot(w_digital / pi, mag, 'LineWidth', 1.5)
grid on
ylabel('Gain')
title('Linearized form', 'FontWeight', 'normal')
nexttile([1 1])
plot(w_digital / pi, phase, 'LineWidth', 1.5)
grid on
ylabel('Phase (degree)')
title('Phase plot', 'FontWeight', 'normal')
xlabel(l, 'Normalized Frequency (\times \pi rad/sample)')
title(l, sprintf('Frequency response of %s filter\n(PUL074BEX007)', selected_filter));
print(sprintf('../Figures/%s', selected_filter), '-depsc')

