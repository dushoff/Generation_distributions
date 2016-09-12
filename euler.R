
# Calculate R from a distribution using Euler's equation
EulerR <- function(tau, C){
	return(1/mean(exp(-tau/C)))
}
## Clumsily vectorize the function above
EulerCurve <- function(CC, tau){
	sapply(CC, function(cc){
		return(EulerR(tau, C=cc))
	})
}

