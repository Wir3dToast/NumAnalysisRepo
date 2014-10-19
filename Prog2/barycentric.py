# Constructs barycentric weights 
#inter_list is the list with all the nodes to use to calculate the weight except xj
# xj
def construct_weight(inter_list, xj):
	weight_rec = 1 #reciprocal
	for xk in inter_list:
		weight_rec *= (xj - xk)
	return 1 / weight_rec

# inter_list is the list of all of the interpolating nodes
def construct_barycentric(node_list, func, eval_point):
	bary_num = 0 #Numerator of barycentric interpolation formula
	bary_denom = 0 #Denominator of barycentric interpolation formula
	for node in node_list:
		inter_list = node_list.tolist()
		inter_list.remove(node)

		bary_weight = construct_weight(inter_list,node) #lambda xj

		bary_denom += (bary_weight) / (eval_point - node)
		bary_num += (bary_weight * func(eval_point)) / (eval_point - node)
	return bary_num / bary_denom


def barycentric_inter(node_list, eval_point ,func):
	if eval_point in node_list:
		return func(eval_point)

	return construct_barycentric(node_list,func,eval_point)

