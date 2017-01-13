set.seed(103)

nq <- 10000
q <- (2*(1:nq)-1)/(2*nq)

inc <- read.csv("RabiesIncubation.csv")
inc <- clean_rabies(inc)

ii <- read.csv("RabiesInfection.csv")
ii <- clean_rabies(ii)

lat <- sample(inc, nq, replace = TRUE)
inf <- sample(ii, nq, replace = TRUE, prob = ii/sum(ii))

gen <- runif(nq, min=lat, max=lat+inf)

print(mean(gen))
print(sd(gen))

dname <- "Rabies"
dgen <- gen

## rabies reproduction number?
Reff <- 1.1
rho_eff <- 0.0041
