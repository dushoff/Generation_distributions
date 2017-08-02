rho <- seq(0, xmax, by=0.1)
## Scaling by mean generation time 
baseplot <- function(){
	plot(rho, EulerCurve(gbar/rho, gen)
		, type="l"
		, ylim=c(1, ymax)
		, xlab = expression(Relative~length~of~generation~interval~(rho))
		, ylab = "Reproductive number"
	)
}

# Version with extra curves
# Blue is the approximations
baseplot()
lines(rho, EulerCurve(gbar/rho, gamgen), col="blue")

pp <- c(19, 17, 15)

points(rho_eff, Reff, pch=pp[1:length(Reff)])
curve(1+x, add=TRUE, col="blue", lty=3)
curve(exp(x), add=TRUE, col="blue", lty=3)

