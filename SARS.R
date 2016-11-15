source("trapezoid.R")

nq <- 10000
q <- (2*(1:nq)-1)/(2*nq)

gen <- qtrap(q)

print(mean(gen))
print(sd(gen))

dname <- "SARS"
dgen <- gen

## SARS reproduction number
Reff <- 3.2
rho_eff <- 0.134
