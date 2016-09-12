
par(cex=1.5)

rho <- seq(0.1, 2.0, by=0.1)

baseplot <- function(){
	plot(rho, EulerCurve(gbar/rho, gen)
		, type="l"
		, ylim=c(1, 5)
		, xlab = "Exponential growth rate (per month)"
		, ylab = "Effective reproductive number R"
	)
}

# Talk version with extra curves (note that colors are different from old one)
# Black represents data
baseplot()
lines(rho, EulerCurve(gbar/rho, gamgen), col="blue")
points(rho_eff, Reff, pch=19)
curve(1+x, add=TRUE, col="blue")
curve(exp(x), add=TRUE, col="blue")

# Paper version
