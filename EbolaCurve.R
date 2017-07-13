rho <- seq(0, xmax, by=0.1)
## you are also scaling by mean generation time here
baseplot <- function(){
	plot(rho, EulerCurve(gbar/rho, gen)
		, type="l"
		, ylim=c(1, ymax)
		, xlab = "Rescaled exponential growth rate" ## you scale and have per month. should be per days!
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
