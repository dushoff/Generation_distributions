source("lognormal.R")
source("gamma.R")
source("euler.R")
source("WHO.R")
source("EbolaCurve.R")

# SEIR model
lines(rho, (1 + rho*dtime/gbar)*(1 + rho*itime/gbar), col = "red")

##SEmInR model (assume gamma distributed latent and infectious period)
dbar <- mean(lat)
dshape <- (dbar^2/var(lat))

ibar <- mean(ii)
ishape <- (ibar^2/var(ii))

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
EmpiricalR <- function(tau, r, breaks){
    h <- hist(tau, breaks = breaks, plot = FALSE)
    a <- h$breaks
    y <- h$counts/sum(h$counts)
    return(r/(sum(y * -diff(exp(-a * r))/diff(a))))
}

EmpiricalCurve <- function(rr, tau, breaks){
    sapply(rr, function(x){EmpiricalR(tau, x, breaks)})
}

## Increasing the number of breaks causes this line to converge to the base plot
## but we are given the entire distribution in this case. so I'm guessing that 
## if we use the real empirical data instead of "gen" we'll get something that's less like the
## actual distribution
lines(rho, EmpiricalCurve(rho/gbar, gen, 200), col = "green")
