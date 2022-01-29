Ts = input('Enter sampling time: ');
selected_transformation = input('Enter transformation method: ', 's');
b_analog = [1 0.1];
a_analog = [1 0.2 9.01];
fs = 1 / Ts;
[b_digital, a_digital] = transformation_selector(b_analog, a_analog, fs, selected_transformation);
[Ha, Wa] = freqs(b_analog, a_analog, 512);
[Hz, Wz] = freqz(b_digital, a_digital, 512, fs);
figure(1)
l1 = tiledlayout(1, 1);
nexttile
plot(Wa/(2*pi), 20 * log10(abs(Ha)), 'LineWidth', 1.5)
hold on
plot(Wz, 20 * log10(abs(Hz)), 'LineWidth', 1.5)
hold off
xlabel('Frequency (Hz)')
ylabel('Magnitude (dB)')
title(l1, {'Plot for magnitude response comparison when conversion performed', sprintf('using %s for T=%.2f sec', selected_transformation, Ts), '(PUL074BEX007)'})
legend('Analog Filter', 'Digital Filter')
sys_analog = tf(b_analog, a_analog);
figure(2)
l2 = tiledlayout(1, 1);
[y1, t1] = impulse(sys_analog,100);
nexttile
plot(t1, y1, 'LineWidth', 1)
hold on
[y2, t2]=dimpulse(b_digital,a_digital,100);
stairs(y2, 'LineWidth', 1)
hold off
xlabel('Time (seconds)')
ylabel('Amplitude')
title(l2, {'Plot for impulse response comparison when conversion performed', sprintf('using %s for T=%.2f sec', selected_transformation, Ts), '(PUL074BEX007)'})
legend('Analog Filter', 'Digital Filter')
print('-f1', sprintf('../Figures/mag_res_%s_%d', selected_transformation, round(Ts)), '-depsc')
print('-f2', sprintf('../Figures/impulse_res_%s_%d', selected_transformation, round(Ts)), '-depsc')