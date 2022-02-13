function [beta] = betaValue(A)
     switch true
        case A>50
            beta=0.1102.*(A-8.7);
        case (21<=A)&&(A<=50)
            beta=0.5842.*(A-21)^0.4+0.07886.*(A-21);
        case A<21
            beta=0;
        otherwise
            beta=0;
    end
end

