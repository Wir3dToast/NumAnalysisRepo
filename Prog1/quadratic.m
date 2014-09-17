function [root1, root2] = quadratic(a,b,c)
% Finds the roots of the quadratic equation with the coefficents a,b,c 
root1 = (-b + sqrt(b^2 -4*a*c))/(2*a)
root2 = (-b - sqrt(b^2 -4*a*c))/(2*a)
end

