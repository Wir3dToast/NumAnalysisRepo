n = 10;

a=zeros(1,n);
b=[2,[1:n].^2./(4*[1:n].^2-1)];

coef = CoefficientMatrix(a,b);

x = sort(roots(coef(n+1,1:n+1)));
Phi = zeros(n,n);

for j=1:n 
    Phi(j,:) = polyval(coef(j,1:j),x); %Calculate Phi
end

w=1.0./diag(Phi'*Phi);

disp(x);
disp(w);

E = zeros(2*n+1,1); %Error Vector

for k=0:2*n %Error Calculations
    E(k+1)=abs(w'*cos(k*acos(x)) - (1+(-1)^k)/(1-k^2 + 1.0e-18)); 
end

disp(E); %Display Error Vector

n = 40;

a=zeros(1,n);
b=[2,[1:n].^2./(4*[1:n].^2-1)];

coef = CoefficientMatrix(a,b);

x = sort(roots(coef(n+1,1:n+1)));
Phi = zeros(n,n);

for j=1:n 
    Phi(j,:)=polyval(coef(j,1:j),x); %Calculate Phi
end

w=1.0./diag(Phi'*Phi);

E = zeros(2*n+1);

for k=0:2*n 
    E(k+1)=abs(w'*cos(k*acos(x)) - (1+(-1)^k)/(1-k^2 + 1.0e-18)); 
end

disp(norm(E(1:80)));