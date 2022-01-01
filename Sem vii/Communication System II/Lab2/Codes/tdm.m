% Signal generation
x = 0:0.1:4 * pi;
signal_a = 8 * sin(x);
l = length(signal_a);
signal_b = 8 * triang(l);
g = tiledlayout(4, 2);
title(g, 'Time Division Multiplexing (PUL074BEX007)')

% Displaying og signals
nexttile
plot(signal_a);
title('Signal a');
grid on
nexttile
plot(signal_b);
title('Signal b');
grid on

% Displaying stem-version of og signals
nexttile
stem(signal_a);
title('Signal a (Quantized)');
nexttile
stem(signal_b);
title('Signal b (Quantized)');

% Conversion of row vector to a matrix
l1 = length(signal_a);
l2 = length(signal_b);
for i = 1:l1
    signal(1, i) = signal_a(i);
    signal(2, i) = signal_b(i);
end

% Multiplexing (TDM) of quantized signals
tdmsig = reshape(signal, 1, 2 * l1);
nexttile([1, 2])
stem(tdmsig);
title('TDM signal');

% Demultiplexing of TDM signal
demux = reshape(tdmsig, 2, l1);
% Conversion of a matrix to row vectors
for i = 1:l1
    signal_a_recovered(i) = demux(1, i);
    signal_b_recovered(i) = demux(2, i);
end

% Displaying recovered signals
nexttile
plot(signal_a_recovered);
grid on
title('Recovered signal a');
nexttile
plot(signal_b_recovered);
title('Recovered signal b');
grid on
