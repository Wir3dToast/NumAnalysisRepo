from numpy import linspace 
from numpy import cos
from numpy import pi 
from matplotlib import pyplot

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
		inter_list = xin.tolist()
		node = inter_list.pop(inter_list.index(inter_point))
		lagrange_func = construct_lagrange(inter_list, node) #Return lagrange polynomial
		lagrange_polynomial = lambda eval_point: lagrange_func(eval_point) * func_values[inter_point]
		for eval_point_index in len_xout:
			yout[eval_point_index] += lagrange_polynomial(xout[eval_point_index])
	return yout

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

		yout_lin = lagrange_inter(lin_xin, xout, func)
		yout_cheby = lagrange_inter(cheby_xin,xout,func)
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