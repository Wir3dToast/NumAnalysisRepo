function [root1, root2] = quadratic(a,b,c)
% Finds the roots of the quadratic equation with the coefficents a,b,c 
root1 = (-2*c)/(b + sqrt(b^2 -4*a*c));
root2 = (-2*c)/(b - sqrt(b^2 -4*a*c));
end

