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

# SEIR model
lines(rho, (1 + rho*dtime/gbar)*(1 + rho*itime/gbar), col = "red")

##SEmInR model (assume gamma distributed latent and infectious period)
dbar <- mean(lat)
dshape <- round(dbar^2/var(lat))

ibar <- mean(ii)
ishape <- round(ibar^2/var(ii))

SeminrR <- function(C){
    r <- 1/C
    return(
        (1 + r * dbar/dshape)^dshape * (1 + r * ibar/ishape)^ishape
    )
}

SeminrCurve <- function(CC){
    sapply(CC, function(x) SeminrR(x))
}

lines(rho, SeminrCurve(gbar/rho), col = "red", lty = 2)

# Empirical distribution
EmpiricalR <- function(tau, C, breaks){
    h <- hist(tau, breaks = breaks, plot = FALSE)
    a <- h$breaks
    y <- h$counts/sum(h$counts)
    return(1/(C * sum(y * -diff(exp(-a/C))/diff(a))))
}

EmpiricalCurve <- function(CC, tau, breaks){
    sapply(CC, function(x){EmpiricalR(tau, x, breaks)})
}

## Increasing the number of breaks causes this line to converge to the base plot
## but we are given the entire distribution in this case. so I'm guessing that 
## if we use the real empirical data instead of "gen" we'll get something that's less like the
## actual distribution
lines(rho, EmpiricalCurve(gbar/rho, gen, 20), col = "green")
