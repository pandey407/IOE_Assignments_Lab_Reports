% Signal generation
am = 5;
fm = 1;
fs = 50 * fm;
t = 0:1 / fs:((1 / fm) - (1 / fs));
x = am * sin(2 * pi * fm * t);
g = tiledlayout(2, 1);
title(g, 'Delta Modulation (PUL074BEX007)')

% Displaying og signal
nexttile
plot(x);
axis([0 50 -6 6]);
hold on;

% Delta modulation
del = (2 * pi * am * fm) / fs;
for i = 1:length(x)
    if i == 1
        e(i) = x(i);
        eq(i) = del * sign(e(i));
        xq(i) = eq(i);
    else
        e(i) = x(i) - xq(i - 1);
        eq(i) = del * sign(e(i));
        xq(i) = eq(i) + xq(i - 1);
    end
end

% Bit sequence for DM transmission
for i = 1:length(x)
    if e(i) > 0
        dm(i) = 1;
    else
        dm(i) = 0;
    end
end

% Displaying DM stairs over og signal
stairs(xq, 'LineWidth', 0.8, 'Color', '#D95319');
title('Delta modulation of original signal');

% Displaying bit sequence
nexttile
stairs(dm, 'LineWidth', 1, 'Color', '#D95319');
axis([0 50 -0.2 1.2]);
title('Bit sequence for DM transmission');
