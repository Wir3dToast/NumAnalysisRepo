function [ weight ] = BarycenWeight( xin, node )

weight_denom = 1;
for xk = xin
    if xk ~= node
        weight_denom = weight_denom * (node - xk);
    end 
end
weight = 1 / weight_denom;
end

