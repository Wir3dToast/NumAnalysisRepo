n = 10;

a=zeros(1,n);
b=[2,[1:n].^2./(4*[1:n].^2-1)];

E = zeros(2*n+1,1);

[x,w] = GolubWelsch(a,b);

for k=0:2*n 
    E(k+1)=abs(w'*cos(k*acos(x)) - (1+(-1)^k)/(1-k^2 + 1.0e-18)); 
end

disp(x);
disp(w);
disp(E);

n = 40;
a=zeros(1,n);
b=[2,[1:n].^2./(4*[1:n].^2-1)];

E = zeros(2*n+1);

[x,w] = GolubWelsch(a,b);

for k=0:2*n 
    E(k+1)=abs(w'*cos(k*acos(x)) - (1+(-1)^k)/(1-k^2 + 1.0e-18)); 
end

disp(norm(E(1:80)));
