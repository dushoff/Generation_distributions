rho <- seq(0.1, 2.0, by=0.1)

EulerR <- function(tau, C){
	return(1/mean(exp(-tau/C)))
}

EulerCurve <- function(CC, tau){
	sapply(CC, function(cc){
		return(EulerR(tau, C=cc))
	})
}

par(cex=1.5)

plot(rho, EulerCurve(gbar/rho, gamgen)
	, type="l"
	, ylim=c(1, 5)
	, xlab = "Exponential growth rate (per month)"
	, ylab = "Effective reproductive number R"
)

lines(rho, EulerCurve(gbar/rho, gen), col="blue")

curve(1+x, add=TRUE)
curve(exp(x), add=TRUE)

Geff <- 15.3
Reff <- c(1.81, 1.51, 1.38)
doub <- c(15.7, 23.6, 30.2)

rho_eff <- Geff*log(2)/doub

points(rho_eff, Reff, pch=19)

print(data.frame(rho_eff, Reff))

