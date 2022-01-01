n=8;
x=randi([0,1],1,n)
Tb=.000001; 
N = length(x);
nb = 100;
bit = [];
for n = 1:N
    if x(n) == 1
        sig = ones(1,nb);
    else 
        sig = zeros(1,nb);
    end
    bit = [bit sig];
end
disp('Generated bit pattern');
disp(x);