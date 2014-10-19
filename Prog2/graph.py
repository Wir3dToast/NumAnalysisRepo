
from barycentric import barycentric_inter
from lagrange import lagrange_inter
from numpy import linspace 
from numpy import cos
from numpy import pi 
from matplotlib import pyplot

def main():

	func = lambda x: 1 / (1 + 0.9 * (x**2))
	xout = linspace(-1,1,500)

	n_list = [10,19]
	figure_num = 1 #To show figures at same time 

	for n in n_list:
		lin_xin = linspace(-1,1,n+1).tolist() #n = 10
		cheby_xin = map(cos, linspace(-pi,0,n+1).tolist())
		print("ChebyShev and Linspace for n = {0}: \n {1} \n {2}".format(n,lin_xin, cheby_xin))

		yout_lin = lagrange_inter(lin_xin,xout,func)
		yout_cheby = lagrange_inter(cheby_xin,xout,func)
		pyplot.figure(figure_num)
		pyplot.plot(xout,yout_lin)
		pyplot.title("Linspace for n = {0}".format(n))
		figure_num += 1
		pyplot.figure(figure_num)
		pyplot.plot(xout,yout_cheby)
		pyplot.title("Chebyshev for n = {0}".format(n))
		figure_num += 1
	pyplot.show()	

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

	n2_list = [50,99]

	figure_num = 1

	for n in n2_list:
		lin_xin = linspace(-1,1,n+1).tolist() #n = 10
		yout_lin_lag = lagrange_inter(lin_xin,xout,func)
		yout_lin_bary =  barycentric_inter(lin_xin, xout, func)

		pylot.figure(figure_num)
		pyplot.semilogy(xout, 1.0e-18 + abs([yout1-f(xout),yout2-f(xout)])
		figure_num += 1
	pylot.show()


if __name__ == "__main__":
	main()