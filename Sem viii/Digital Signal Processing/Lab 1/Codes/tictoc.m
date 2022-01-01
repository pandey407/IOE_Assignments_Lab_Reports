clear ; %To clear all previous variables, and to free memory.
tic ; %This function initializes an internal clock
for i = 1:1000
    b(i) = sqrt(i);
end
t=toc;
str=sprintf('The time required was: %f',t);
disp(str)