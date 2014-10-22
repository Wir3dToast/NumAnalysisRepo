n = [50,99];
for index = 1 : 2
    f = @(x) 1.0 ./ (1 + 9 .* x .^2);
    xin_uniform = linspace(-1,1,n(index) + 1);
    xin_cheby = cos(linspace(-pi,0,n(index)+1));
    xout = linspace(-1,1,500);
    
    yout1 = LagInter(xin_uniform, xout);
    yout2 = BaryInter(xin_uniform, xout);

    figure;
    semilogy(xout,(1.0e-18+abs([(yout1' - f(xout))',(yout2'- f(xout))']))','linewidth',1);  
    hold on;
    
    yout1 = LagInter(xin_cheby, xout);
    yout2 = BaryInter(xin_cheby, xout);
    

    figure;
    semilogy(xout,(1.0e-18+abs([(yout1' - f(xout))',(yout2'- f(xout))']))','linewidth',1)    
end
