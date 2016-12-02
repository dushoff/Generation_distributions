genX <- function(rho, kappa=0){
	if (kappa==0)
		return(exp(rho))
	return((1+rho*kappa)^(1/kappa))
}

vgenX <- Vectorize(genX)

genN <- function(rho, shape=NULL, kappa=NULL){
	return(rho/(1-1/genX(rho, shape, kappa)))
}
