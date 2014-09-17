function [ ] = question11c()
p_current = 0.75;
p_before = 0;
tol = 10^-5;
num_of_iter = 0;

while abs(p_current - p_before) >= tol
    p_before = p_current;
    p_current = (exp(p_before)/3)^(1/2);
    num_of_iter = num_of_iter + 1;
end
disp(num_of_iter);
end