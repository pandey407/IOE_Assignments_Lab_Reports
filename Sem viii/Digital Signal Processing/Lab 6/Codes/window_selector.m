function [h] = window_selector(M, selected_filter)
    switch selected_filter
        case 'hamming'
            h = hamming(M);
        case 'hanning'
            h = hanning(M);
        case 'blackman'
            h = blackman(M);
        case 'bartlett'
            h = bartlett(M);
        otherwise
            error('The window you want is not found.')
    end
end
