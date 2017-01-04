rho <- seq(0.001, 1.5 * rho_eff, by=0.001)

baseplot <- function(){
    plot(rho, EulerCurve(1/rho, gen)
         , type="l"
         , xlab = "Exponential growth rate (per day)"
         , ylab = "R"
    )
}

# Version with extra curves (note that colors are different from old one)
# Similar to original talk version, and currently recommended for talk and paper 
# Black represents data and detailed fits.
# Blue is the approximations
baseplot()
lines(rho, EulerCurve(1/rho, gamgen), col="blue")
points(rho_eff, Reff, pch=19)
curve(1+gbar * x, add=TRUE, col="blue", lty=3)
curve(exp(gbar * x), add=TRUE, col="blue", lty=3)
