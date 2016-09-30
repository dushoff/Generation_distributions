source("lognormal.R")
source("gamma.R")
source("euler.R")
source("WHO.R")
source("EbolaCurve.R")

wallingaNormal <- function(r, tau, sd){
    return(exp(r * tau - (1/2) * r^2 * sd^2))
}

wallingaR <- function(rr, tau, sd){
    sapply(rr,function(x){
        return(wallingaNormal(x, tau, sd))
    })
}

lines(rho, wallingaR(rho/gbar, gbar, sd(gen)), col = "red")
