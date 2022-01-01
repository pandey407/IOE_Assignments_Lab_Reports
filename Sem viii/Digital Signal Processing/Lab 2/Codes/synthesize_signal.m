function y = synthesize_signal(C,t)
    len = length(C);
    w = -floor(len/2):floor(len/2);
    y = sum(C' .* exp(1i.* w' .* t));
end

