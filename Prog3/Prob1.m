
n = 10;
a = zeros(1,n);
b=[2,[1:n].^2./(4*[1:n].^2-1)];
x=cos(linspace(-pi,0,10*n));

phi1 = LegendreRecurrence(a,b,x,10);
plot(x, phi1(11,:),'b'); %Extract last row


n = 50;
a = zeros(1,n);
b=[2,[1:n].^2./(4*[1:n].^2-1)];
x=cos(linspace(-pi,0,10*n));

phi2 = LegendreRecurrence(a,b,x,50);
plot(x, phi2(51,:),'g'); 


