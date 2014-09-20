n_terms = 1:40;
cell_arr1 = cell(1,40);
result_mat = cell2mat(cell_arr);
for n=1:40
   result_mat(n) = compute_sequence(n);
end
figure
plot(n_terms,result_mat,'*');

cell_arr2 = cell(1,40);
error_mat = cell2mat(cell_arr2);
for n=1:40
   error_mat(n) = log(abs(result_mat(n) - 3));
end

figure
plot(n_terms,error_mat,'*');
hold on
fplot('3 - (log(2) * x)',[1 40]);
