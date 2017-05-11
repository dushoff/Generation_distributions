xmax <- 3
ymax <- exp(3)

dtype <- "fitted"
dname <- "Dicey SEIR"

pars <- list(
    dtime = 12.5, ## Cummings et al. 2009 from a systematic review
    disp = 1.23,
    itime = 3.65, ## Using some dicey inferences from Alun Lloyd for infectious period
    ishape = 5
)

lat <- expression({
    lat <- qlnorm(q, sdlog=log(disp))
    lat*dtime/mean(lat)
})

ii <- expression({
    qgamma(q, scale=itime/ishape, shape=ishape)
})

Reff <- 13
