function y = exponential_response_polar(C,r,w,theta,t)
    y = abs(C).* exp(r .* t).*(cos(w.*t+theta)+1i.*sin(w.*t+theta));
end