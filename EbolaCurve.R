rho <- seq(0.1, 2.0, by=0.1)

baseplot <- function(){
	plot(rho, EulerCurve(gbar/rho, gen)
		, type="l"
		, ylim=c(1, 5)
		, xlab = "Exponential growth rate (per month)"
		, ylab = "R"
	)
}

# Version with extra curves (note that colors are different from old one)
# Similar to original talk version, and currently recommended for talk and paper 
# Black represents data and detailed fits.
# Blue is the approximations
baseplot()
lines(rho, EulerCurve(gbar/rho, gamgen), col="blue")
points(rho_eff, Reff, pch=19)
curve(1+x, add=TRUE, col="blue", lty=3)
curve(exp(x), add=TRUE, col="blue", lty=3)

# New version lacks extra curves (not currently used)
