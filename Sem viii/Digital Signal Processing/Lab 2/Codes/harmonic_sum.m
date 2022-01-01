function [fn, y] = harmonic_sum(w,n,t)
  no = 1:n;
  fn = sin(no.'.*w.*t);
  y = sum(fn,1);
end

