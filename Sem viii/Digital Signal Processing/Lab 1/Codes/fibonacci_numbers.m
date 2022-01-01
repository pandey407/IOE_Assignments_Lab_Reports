function fibo_numbers = fibonacci_numbers(maxSum)
    f1=0;
    f2=1;
    fibo_numbers=[f1 f2];
    while (f1+f2) < maxSum
        next=f1+f2;
        f1=f2;
        f2=next;  
        fibo_numbers(end+1)=next;
    end
end

