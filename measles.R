xmax <- 3.2
ymax <- exp(xmax)

dtype <- "fitted"
dname <- "Dicey SEIR"

pars <- list( ## dtime is median here
    dtime = 12.5, ## Cummings et al. 2009 from a systematic review
    disp = 1.23,
    itime = 3.65, ## Dicey inferences from Alun Lloyd 
    ishape = 5
)

## transform median to mean
lat <- expression({
    lat <- qlnorm(q, meanlog=log(dtime), sdlog=log(disp))
})

ii <- expression({
    qgamma(q, scale=itime/ishape, shape=ishape)
})

Reff <- c(12.8, 16)
