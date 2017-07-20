## Deprecated; this has too much stuff for the generic curve function.
## Goal: Simplify this, and change existing references to point to EbolaCurve

rho <- seq(0.1, 2.0, by=0.1)

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

## Points corresponding to WHO estimates
Ghat <- 15.3
Reff <- c(1.81, 1.51, 1.38)
doub <- c(15.7, 23.6, 30.2)

rho_eff <- Ghat*log(2)/doub
print(data.frame(rho_eff, Reff))


par(cex=1.5)

plot(rho, EulerCurve(gbar/rho, gamgen)
	, type="l"
	, ylim=c(1, 5)
	, xlab = "Exponential growth rate (per generation)"
	, ylab = "Effective reproductive number R"
)

lines(rho, EulerCurve(gbar/rho, gen), col="blue")
points(rho_eff, Reff, pch=19)
curve(1+x, add=TRUE)
curve(exp(x), add=TRUE)
