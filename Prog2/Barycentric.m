f = @(x) 1.0 ./ (1 + 9 .* x .^2);
n = [10,19];
for index = 1 : 2

    xin_uniform = linspace(-1,1,n(index)+1);
    xin_cheby = cos(linspace(-pi,0,n(index)+1));
    xout = linspace(-1,1,500);

    yout_uniform = BaryInter(xin_uniform, xout);
    yout_cheby = BaryInter(xin_cheby, xout);

    figure;
    plot(xout, yout_uniform,'b',xout, arrayfun(f,xout),'g',xin_uniform, arrayfun(f,xin_uniform),'*');    
    hold on;
    figure;
    plot(xout, yout_cheby,'b',xout, arrayfun(f,xout),'g',xin_uniform, arrayfun(f,xin_cheby),'*');
end