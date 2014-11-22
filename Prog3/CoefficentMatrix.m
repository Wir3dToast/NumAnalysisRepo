function [ S ] = CoefficientMatrix(a,b)

n = length(a);
S = zeros(n+1,n+1);
S(1,1) = sqrt(1/2); %Esstentially sqrt(1/b(1))
S(2,:) = (S(1,:) - [0,a(1)*S(1,1:end-1)]) / sqrt(b(2));

column_index = 3;

for i=1:n-1
   prev = column_index-1;
   S(column_index,:) = (S(prev,:) - [0,a(prev)*S(prev,1:end-1)] - [0,0,sqrt(b(prev))*S(prev-1,1:end-2)]) / sqrt(b(column_index));
    column_index = column_index + 1;
end

end

