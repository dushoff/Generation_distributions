rfun <- function(x, Reff, gen, gbar){
    Reff - EulerR(gen, gbar/x)
}

if (is.null(Reff)) {
    rho_eff <- NULL
} else {
    rho_eff <- sapply(Reff, function(x){
        res <- uniroot(rfun, c(0, 10), gen=gen, Reff=x, gbar=gbar)
        return(res$root)
    })
}
