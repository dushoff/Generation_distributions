set.seed(628)
xmax <- 3
ymax <- exp(3)

## Need to check how to interpret Cummings fit!
nq <- 10000
dtime <- 12.5 ## Cummings et al. 2009 from a systematic review
dshape <- log(1.23) ## Cummings et al
##disp: 1.23

## Using some dicey inferences from Alun Lloyd for infectious period
itime <- 3.65
ishape <- 5

## Not using random stuff from Schenzle
## dtime <- 8
## itime <- 5

q <- (2*(1:nq)-1)/(2*nq)

ii <- qgamma(q, scale=itime/ishape, shape=ishape)

inf <- sample(ii, size=nq, replace=TRUE, prob=ii/sum(ii))

lat <- qlnorm(q, sdlog=dshape)
lat <- lat*dtime/mean(lat)

gen <- runif(nq, min=lat, max=lat+inf)

print(mean(gen))
print(sd(gen))

dname <- "Exponential SEIR"
dgen <- gen

Reff <- c(13)
gbar <- mean(gen)

