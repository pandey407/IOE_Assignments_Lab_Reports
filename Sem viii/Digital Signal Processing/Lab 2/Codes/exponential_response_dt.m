function y = exponential_response_dt(a,theta,n)
  y = (abs(a).*exp(1i.*theta)).^n;
end