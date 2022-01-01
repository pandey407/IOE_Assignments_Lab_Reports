% Signal generation
t = 0:0.1:20;
f1 = 0.1;
f2 = 0.2;
x = sin(2 * pi * f1 * t) + sin(2 * pi * f2 * t);
g = tiledlayout(3, 1);
title(g, 'Sampling and Signal Reconstruction (PUL074BEX007)')

% Displaying og signal
nexttile
plot(t, x);
hold on;
plot([0 20], [0 0], 'black');
hold off;
title('Original signal');
xlabel('Time');
ylabel('Amplitude');

% Sampling of og signal
nexttile
x_samples = x(1:10:201);
stem(x_samples, 'filled');
title('Sampled signal');
xlabel('n');
ylabel('x_s(n)');
axis([1 21 -2 2]);

% Reconstruction using samples
x_recon = 0;
nexttile
for k = 0:length(x_samples) - 1
    stem(0:length(x_samples) - 1, x_samples, 'filled');
    if k == length(x_samples) - 1
        title('Reconstructed signal');
    else
        title(sprintf('Sample by sample reconstruction at n=%d', k));
    end
    grid on;
    l = k:-0.1:-20 + k;
    x_recon = x_recon + (x_samples(k + 1) * sinc(l));
    axis([0 20 -2 2]);
    xlabel('n');
    ylabel('x_s(n)');
    hold on;
    plot(t, x_samples(k + 1) * sinc(l), 'r');
    plot(t, x_recon);
    hold off;
    waitforbuttonpress;
end
