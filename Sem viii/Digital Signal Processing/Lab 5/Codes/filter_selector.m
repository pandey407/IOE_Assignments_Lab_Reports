function [N, wc, b_digital, a_digital] = filter_selector(wp, ws, Rp, Rs, selected_filter)
    switch selected_filter
        case {'butterworth', 'butter'}
            [N, wc] = buttord(wp, ws, Rp, Rs);
            [b_digital, a_digital] = butter(N, wc);
        case {'chebyshev I', 'cheby1'}
            [N, wc] = cheb1ord(wp, ws, Rp, Rs);
            [b_digital, a_digital] = cheby1(N, Rp, wc);
        case {'chebyshev II', 'cheby2'}
            [N, wc] = cheb2ord(wp, ws, Rp, Rs);
            [b_digital, a_digital] = cheby2(N, Rs, wc);
        case {'elliptic', 'ellip'}
            [N, wc] = ellipord(wp, ws, Rp, Rs);
            [b_digital, a_digital] = ellip(N, Rp, Rs, wc);
        otherwise
            error('The filter you want is not found.')
    end
end
