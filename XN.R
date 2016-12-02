## Probably no point to having the unvectorized functions
genX <- Vectorize(function(rho, kappa=0){
	if (kappa==0)
		return(exp(rho))
	return((1+rho*kappa)^(1/kappa))
})

genN <- Vectorize(function(rho, kappa=NULL){
	if (rho==0) return(1)
	return(rho/(1-1/genX(rho, kappa)))
})

genG <- Vectorize(function(rho, kappa=NULL){
	return(genX(rho=2*rho/(1+kappa), kappa=(5*kappa+1)/(3*kappa+3)))
})
