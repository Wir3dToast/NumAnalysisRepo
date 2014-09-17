function [ ] = question8()
p_current = (2/3);
p_before = 0;
tol = 10^-4;
num_of_iter = 0;

while abs(p_current - p_before) >= tol
    p_before = p_current;
    p_current = 2^(-p_before);
    num_of_iter = num_of_iter + 1;
end
disp(num_of_iter);
end