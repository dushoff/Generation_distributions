xmax <- 2
ymax <- 5

dtype <- "fitted"
dname <- "Lognormal SEIR"

pars <- list(
    dtime = 11.4,
    itime = 5,
    dshape = 0.6,
    ishape = 0.8
)

## Mean based on quantiles may or may not be better than
## calculating sdmean, but we don't care because they 
## are indistinguishable
lat <- expression({
    lat <- qlnorm(q, sdlog=dshape)
    lat*dtime/mean(lat)
})

ii <- expression({
    ii <- qlnorm(q, sdlog=ishape)
    ii*itime/mean(ii)
})
