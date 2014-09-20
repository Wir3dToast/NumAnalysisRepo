function [value] = compute_sequence(n)

if(n == 1)
    value = n;
    return
elseif(n == 2)
    value = sqrt(3);
    return
end

nested_exp = sqrt(1 + (n-1) * sqrt(1 + n));
    n = n - 1;
    
while n ~= 2
    nested_exp = sqrt(1 + (n-1) * nested_exp);
    n = n - 1;
end

value = nested_exp;