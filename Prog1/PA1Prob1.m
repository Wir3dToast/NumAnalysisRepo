a = input('Input lower limit of interval (a)');
b = input('Input upper limit of interval (b)');
c = input('Input coefficient of x^3 (c)');
d = input('Input coefficient of x^2 (d)');
e = input('Input coefficient of x (e)');
f = input('Input shift of cubic function');

[root1, root2] = quadratic(c,d,e);

[lower_limit_value] = get_function_value(a,c,d,e,f);
[upper_limit_value] = get_function_value(b,c,d,e,f);

map = java.util.Hashtable; %Use hashtable to map range values to domain values
map.put(lower_limit_value, a);
map.put(upper_limit_value, b);

A = [lower_limit_value, upper_limit_value];

if isreal(root1) && root1 >= a && root1 <= b  %Check if we are using real values in the relevant interval
    value_at_root1 = get_function_value(root1,c,d,e,f);
    A = [A,value_at_root1];
    map.put(value_at_root1, root1);
end

if isreal(root2) && root2 >= a && root2 <= b
    value_at_root2 = get_function_value(root2,c,d,e,f);
    A = [A,value_at_root2]; 
    map.put(value_at_root2, root2);
end

A = sort(A);

fprintf('p(x min): %i\n',A(1)); % p(x min)
fprintf('p(x max): %i\n',A(end)); %p (x max)
fprintf('x max: %i\n',map.get(A(1))); % x max
fprintf('x min: %i\n',map.get(A(end))); % x min

    
    