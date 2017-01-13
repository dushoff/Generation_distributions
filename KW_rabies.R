source("clean_rabies.R")
source("Rabies.R")
source("gamma.R")
source("euler.R")
source("XN.R")

lbar <- mean(inc)
lkappa <- var(inc)/lbar^2

ibar <- mean(ii)
ikappa <- var(ii)/ibar^2

genKW <- function(C){
    r <- 1/C
    genX(lbar * r, lkappa) * genN(ibar * r, ikappa)
}

source("SARSCurve.R")
lines(rho, genKW(1/rho), col = 2, lty = 4)

rho_eff <- gbar * 0.0041
source("EbolaCurve.R")
lines(rho, genKW(gbar/rho), col = 2, lty = 4)
