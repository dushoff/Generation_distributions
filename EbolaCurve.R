rho <- seq(0.1, xmax, by=0.1)
## Scaling by mean generation time 
baseplot <- function(){
	plot(rho, EulerCurve(gbar/rho, gen)
		, type="l"
		, ylim=c(1, ymax)
		, xlab = "Rescaled exponential growth rate" 
		, ylab = "R"
	)
}

# Version with extra curves
# Blue is the approximations
baseplot()
lines(rho, EulerCurve(gbar/rho, gamgen), col="blue")
points(rho_eff, Reff, pch=19)
curve(1+x, add=TRUE, col="blue", lty=3)
curve(exp(x), add=TRUE, col="blue", lty=3)

