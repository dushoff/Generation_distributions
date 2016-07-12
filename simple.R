set.seed(628)

nq <- 1000
dtime <- 11
itime <- 4
dshape <- 4
ishape <- 4

q <- (2*(1:nq)-1)/(2*nq)

ii <- qgamma(q, scale=itime/ishape, shape=ishape)

inf <- sample(ii, size=nq, replace=TRUE, prob=ii/sum(ii))

lat <- sample(qgamma(q, scale=dtime/dshape, shape=dshape))

gen <- runif(nq, min=lat, max=lat+inf)

mu <- mean(gen)
sig <- sd(gen)
cv <- sig/mu
shape <- 1/cv^2

print(c(mu=mu, sig=sig, cv=cv, shape=shape))

dname <- "Gamma SEIR"
dgen <- gen

