## Probably no point to having the unvectorized functions

# Generalized exponential
genX <- Vectorize(function(rho, kappa=0){
	if (kappa==0)
		return(exp(rho))
	return((1+rho*kappa)^(1/kappa))
})

# The KW N function
genN <- Vectorize(function(rho, kappa=NULL){
	if (rho==0) return(1)
	return(rho/(1-1/genX(rho, kappa)))
})

# The single-gamma approximation to the KW N function
genG <- Vectorize(function(rho, kappa=NULL){
	return(genX(rho=(1+kappa)*rho/2, kappa=(5*kappa+1)/(3*kappa+3)))
})

funFrame <- function(rho, kappa, fun){
	m <- outer(rho, kappa, function(x, y){return(fun(x, kappa=y))})
	f <- (data.frame(rho, m=m)
		%>% gather(kappa, R, m.1:m.4)
	)
	return(f)
}


