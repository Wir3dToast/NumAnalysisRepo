n = 10;
a=zeros(1,n);
b=[2,[1:n].^2./(4*[1:n].^2-1)];
x=cos(linspace(-pi,0,500));

coef1 = CoefficientMatrix(a,b);
y=polyval(coef1(11,[1:11]),x);
plot(x,y,'b');
 
n = 50;
a=zeros(1,n);
b=[2,[1:n].^2./(4*[1:n].^2-1)];

coef2 = CoefficientMatrix(a,b);
y=polyval(coef2(51,[1:51]),x); 
plot(x,y,'g');