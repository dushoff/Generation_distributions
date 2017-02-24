set.seed(103)
xmax <- 0.1
ymax <- exp(xmax)

nq <- 10000
q <- (2*(1:nq)-1)/(2*nq)

inc <- inc$val
inc <- inc[!is.na(inc)]

ii <- inf$val
ii <- ii[!is.na(ii)]

lat <- sample(inc, nq, replace = TRUE)
inf <- sample(ii, nq, replace = TRUE, prob = ii/sum(ii))

gen <- runif(nq, min=lat, max=lat+inf)

print(gbar <- mean(gen))
print(sd(gen))

dname <- "Rabies"
dgen <- gen

## rabies reproduction number?
Reff <- 1.1
rho_eff <- 0.0039*gbar
