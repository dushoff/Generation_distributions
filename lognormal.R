set.seed(628)
xmax <- 2
ymax <- 5

nq <- 10000
dtime <- 11.4
itime <- 5
dshape <- 0.65
ishape <- 0.8

q <- (2*(1:nq)-1)/(2*nq)

ii <- qlnorm(q, sdlog=ishape)
ii <- ii*itime/mean(ii)

inf <- sample(ii, size=nq, replace=TRUE, prob=ii/sum(ii))

lat <- qlnorm(q, sdlog=dshape)
lat <- lat*dtime/mean(lat)

gen <- runif(nq, min=lat, max=lat+inf)

print(mean(gen))
print(sd(gen))

dname <- "Lognormal SEIR"
dgen <- gen

