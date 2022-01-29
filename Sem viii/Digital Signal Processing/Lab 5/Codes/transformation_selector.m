function [b_digital, a_digital] = transformation_selector(b_analog, a_analog, fs, selected_transformation)
    switch selected_transformation
        case {'impulse invariance method', 'impinvar'}
            [b_digital, a_digital] = impinvar(b_analog, a_analog, fs);
        case {'bilinear transformation','bilinear'}
            [b_digital, a_digital] = bilinear(b_analog, a_analog, fs);
        otherwise
            error('The transformation you want is not found.')
    end
end
