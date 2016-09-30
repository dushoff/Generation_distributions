source("lognormal.R")
source("gamma.R")
source("euler.R")
source("WHO.R")
source("EbolaCurve.R")

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

##Flu Example

fluGen <- data.frame(gen = c(1:11),
                     freq = c(6, 8, 12, 14, 2, 1, 0, 2, 2, 1, 2))

fluGen.freq <- as.vector(rep(fluGen$gen, fluGen$freq))
hist(fluGen.freq, breaks = c(0:11))

fluGen.freq2 <- fluGen.freq[fluGen.freq < 7 & fluGen.freq > 1]
hist(fluGen.freq2, breaks = c(0:7))

n <- length(fluGen.freq2)
(m <- sum(fluGen.freq2 - 0.5)/n)
# I think wallinga and lipsitch are using variance instead of sd??
(var <- sum((fluGen.freq2 - 0.5 - m)^2)/n)

r <- seq(0.01, 1, by = 0.01)

plot(r, EmpiricalCurve(r, fluGen.freq2, breaks = c(0:7)), type = "l", ylab = "R")

flugamshape <- m^2/var
flugamgen <- qgamma(q, scale=m/flugamshape, shape=flugamshape)

lines(r, EulerCurve(1/r, flugamgen), col="blue")

lines(r, 1 + r * m)
lines(r, (1+ r * m/2)^2)

r.ex <- 0.2

(1 + r.ex * m) #SIR
(1 + r.ex * m/2) * (1 + r.ex * m/2) #SEIR

y <- 1:2

sei2r <- function(r){
    return((1 + r * m/2)/(sum((1 + r * m/4)^(-y))/2))
}

sei2r(r.ex) ##SEI2R???

lines(r, sapply(r, sei2r))

