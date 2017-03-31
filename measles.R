set.seed(628)
xmax <- 3
ymax <- exp(3)

## Need to check how to interpret Cummings fit!
nq <- 10000

## Cummings et al. 2009 from a systematic review
dtime <- 12.5
disp <- 1.23

## Experiment with made-up numbers
# disp <- 3.23

## Using some dicey inferences from Alun Lloyd for infectious period
itime <- 3.65
ishape <- 5

## Not using stuff from Schenzle because it seems over-simplified (exponentials)
## dtime <- 8
## itime <- 5

q <- (2*(1:nq)-1)/(2*nq)

infPeriod <- qgamma(q, scale=itime/ishape, shape=ishape)

infTime <- sample(infPeriod, size=nq, replace=TRUE, prob=infPeriod/sum(infPeriod))

# Lognormals can be confusing; do the latent period shape first, and then set the desired mean
lat <- qlnorm(q, sdlog=log(disp))
lat <- lat*dtime/mean(lat)

gen <- runif(nq, min=lat, max=lat+infTime)

cv <- function(v) sd(v)/mean(v)

print (c( 
	infPeriod = cv(infPeriod)
	, infTime=cv(infTime)
	, lat=cv(lat)
	, gen=cv(gen)
))

dname <- "Exponential SEIR"
dgen <- gen

Reff <- c(13)
gbar <- mean(gen)

