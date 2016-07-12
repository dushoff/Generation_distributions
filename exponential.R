set.seed(628)

m <- mean(dgen)
n <- length(dgen)

dgen <- rexp(n, rate=1/m)
dgen <- dgen*m/mean(dgen)

