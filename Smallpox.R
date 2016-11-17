source("trapezoid.R")

nq <- 10000
q <- (2*(1:nq)-1)/(2*nq)

gen <- qtrap(q, t_a = 14, t_b = 16, t_c = 25, t_d = 27)

print(mean(gen))
print(sd(gen))

dname <- "Smallpox"
dgen <- gen

## Smallpox reproduction number
Reff <- 3.2
rho_eff <- 0.0576
