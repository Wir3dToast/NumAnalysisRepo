#inter_list contains all the nodes which are NOT node
# node is the node to interpolate at.
def construct_lagrange(inter_list, node):
	def lagrange_at_node(eval_point):
		lagrange_val = 1
		for x in inter_list:
			lagrange_val *= ((eval_point - x) / (node - x))
		return lagrange_val
	return lagrange_at_node

# xin contains the interpolation points
# xout contains the evaluation points 
def lagrange_inter(xin, xout, func):
	func_xin = map(func, xin)
	func_values = dict(zip(xin,func_xin))

	len_xout = range(len(xout))

	yout = [0 for i in len_xout] #Values at evaluation points respectively
	for inter_point in func_values: #Construct the lagrange polynomial
		inter_list = list(xin)
		node = inter_list.pop(inter_list.index(inter_point))
		lagrange_func = construct_lagrange(inter_list, node) #Return lagrange polynomial
		lagrange_polynomial = lambda eval_point: lagrange_func(eval_point) * func_values[node]
		for eval_point_index in len_xout:
			yout[eval_point_index] += lagrange_polynomial(xout[eval_point_index])
	return yout