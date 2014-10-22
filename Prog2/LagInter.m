function [ yout ] = LagInter(xin,xout)
    f = @(x) 1.0 ./ (1 + 9 .* x .^2);   
    yout = zeros(length(xout),1);
    index = 1;
    for eval = xout
        for xi = xin
            LagPoly = 1;
            for xk = xin
                if xi ~= xk
                    LagPoly = LagPoly * ((eval - xk) / (xi - xk));
                end   
            end
            yout(index) = yout(index) + (LagPoly * f(xi));
        end
        index = index + 1;
    end
end