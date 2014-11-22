function [ yout ] = BaryInter( xin, xout )

f = @(x) 1.0 ./ (1 + 9 .* x .^2); 
yout = zeros(length(xout),1);

index = 1;
for eval_point = xout
    if any(xin == eval_point)
        yout(index) = f(eval_point); %Return value at interpolating point.
    end
    
    bary_num = 0;
    bary_denom = 0;
    for xj = xin
       weight = BarycenWeight(xin,xj);
       func_value = f(xj);
       
       bary_num = bary_num + (weight * func_value) / (eval_point - xj); %Calculate numerator and denominator
       bary_denom = bary_denom + (weight) / (eval_point - xj);
    end
    yout(index) = bary_num / bary_denom; 
    index = index + 1;
end
end

