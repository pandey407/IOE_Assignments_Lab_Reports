maxSum=10000;
fibo=fibonacci_numbers(maxSum);
l=tiledlayout(1,1);
str=sprintf('sum of two consecutive numbers less than %d',maxSum);
title(l,{'Fibonacci numbers with', str, '(PUL074BEX007)'})
nfibo=length(fibo);
fibo_even=[];
fibo_odd=[];
nexttile
hold on
xlim([0 nfibo])
for i = 1:nfibo
    if(rem(fibo(i),2)==0)
        fibo_even(end+1)=fibo(i);
        stem(i,fibo(i),'rs-','Linewidth',1.5)
    else
        fibo_odd(end+1)=fibo(i);
        stem(i,fibo(i),'bo-','Linewidth',1.5)
    end
end
xlabel('Index')
ylabel('Fibonacci Number')
legend('Even', 'Odd');
fprintf('Total fibonacci numbers: %d \n', nfibo);
fprintf('Even fibonacci numbers: %d \n', length(fibo_even));
fprintf('Odd fibonacci numbers: %d \n', length(fibo_odd));
print('lab_1_3','-depsc');