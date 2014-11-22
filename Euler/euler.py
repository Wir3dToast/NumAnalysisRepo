#Must use python3 to force floating point division
def EulerMethod(func, step_size, start, end, initial_value, sol=None):

	step = start
	step_num = 1
	step_approx = initial_value
	while step < end:
		step_approx = step_approx + step_size * func(step, step_approx)
		step += step_size
		print("Step {0} at {1} : {2}\n".format(step_num,step,step_approx))
		if sol:
			print("Actual Solution at {0} : {1}\n".format(step, sol(step)))
			print("Error between Actual and Euler at {0} : {1}".format(step,abs(step_approx - sol(step))))
		step_num += 1

def main():

	EulerMethod(lambda t,y: (1 + t) / (1 + y),0.5,1,2,2)
	print('\n')
	EulerMethod(lambda t,y: (1 / t ** 2) - (y / t) - y**2 , 0.05,1,2,-1,lambda y :- (1 / y))


if __name__ == "__main__":
	main()