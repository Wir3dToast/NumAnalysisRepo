function [ phi_matrix ] = LegendreRecurrence(av,bv,x,n)

phi_matrix = zeros(n,size(x,2));
n_index = 1; %First index of matrix
a_index = 1; %Starts with 0
b_index = 2; %Starts with 1

row_index = 1;

for xj = x %Setup of first row (phi 0)
    phi_matrix(n_index,row_index) = sqrt(1/2);
    row_index = row_index + 1;
end

n_index = n_index + 1;
row_index = 1;
    
for xj = x %First calculation of second row (phi 1)
    phi_matrix(n_index,row_index) = ((xj - av(a_index)) * sqrt(1/2)) / sqrt(bv(b_index)); 
    row_index = row_index + 1;
end

n_index = n_index + 1; %Set up for iteration of rest of Normalized Legendre Polynomials
a_index = a_index + 1;
b_index = b_index + 1;

for i = 1: n-1
    row_index = 1;
    for xj = x %Use recursive definitions to find nth order Legendre polynomial
        phi_matrix(n_index,row_index) = (((xj - av(a_index)) * phi_matrix(n_index-1,row_index)) - (sqrt(bv(b_index-1)) * phi_matrix(n_index-2,row_index))) / sqrt(bv(b_index));
        row_index = row_index + 1;
    end
    n_index = n_index + 1;
    a_index = a_index + 1;
    b_index = b_index + 1;
end
end

