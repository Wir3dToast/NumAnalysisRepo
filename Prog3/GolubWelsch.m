function [ x,w ] = GolubWelsch(a,b)

n = length(a);
A = zeros(n,n); %Create nxn matrix


A(1,1) = a(1); %Setup of original rows to prepare for 'for loop'
A(1,2) = sqrt(b(2));
A(2,1) = sqrt(b(2));
A(2,2) = a(2);
A(2,3) = sqrt(b(3));

a_index = 3;
b_index = 3;
shift_counter = 2; %Designates the column of the row to start with

for i=3:n %Construct A
    if i ~= n
        A(i , shift_counter) = sqrt(b(b_index));
        A(i , shift_counter + 1) =  a(a_index);
        A(i , shift_counter + 2) = sqrt(b(b_index+1));
    else
        A(i , shift_counter) = sqrt(b(b_index));
        A(i , shift_counter + 1) =  a(a_index);
    end  
    a_index = a_index + 1;
    b_index = b_index + 1;
    shift_counter = shift_counter + 1;
end

[Q,X] = eig(A);

x = diag(X);
w = b(1) * Q(1,:)'.^2;

end

