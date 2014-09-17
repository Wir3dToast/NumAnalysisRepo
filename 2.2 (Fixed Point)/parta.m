function [ ] = parta()

p_current = 1;
p_before = 0;
tol = 10^-3;
num_of_iter = 0;

while abs(p_current - p_before) >= tol
    p_before = p_current;
    p_current = p_before * (1 + (7 - p_before^5)/(p_before^2))^3;
    num_of_iter = num_of_iter + 1;
end
disp(num_of_iter);
end

