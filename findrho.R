rfun <- function(x, Reff, gen, gbar){
    Reff - EulerR(gen, gbar/x)
}

rho_eff <- sapply(Reff, function(x){
    res <- uniroot(rfun, c(0, 4), gen=gen, Reff=x, gbar=gbar)
    return(res$root)
})
