from numpy import linspace 
from numpy import cos
from numpy import pi 
from matplotlib import pyplot

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

def main():
	func = lambda x: 1.0 / (1 + 0.9* (x**2))
	xout = linspace(-1,1,500)
	func_values = map(func,xout)

	n_list = [10,19]
	figure_num = 1 #To show figures at same time 

	for n in n_list:
		lin_xin = linspace(-1,1,n+1) #n = 10
		cheby_xin = cos(linspace(-pi,0,n+1))
		print("ChebyShev and Linspace for n = {0}: \n {1} \n {2}".format(n,lin_xin, cheby_xin))

		yout_lin =  barycentric_inter(lin_xin, xout, func)
		yout_cheby =  barycentric_inter(cheby_xin,xout,func)
		pyplot.figure(figure_num)
		pyplot.plot(xout, func_values,xout,yout_lin)
		pyplot.title("Linspace for n = {0}".format(n))
		figure_num += 1
		pyplot.figure(figure_num)
		pyplot.plot(xout,func_values,xout,yout_cheby)
		pyplot.title("Chebyshev for n = {0}".format(n))
		figure_num += 1
	pyplot.show()

if __name__ == "__main__":
	main()
