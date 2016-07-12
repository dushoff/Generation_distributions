
gbar <- mean(gen)

gamshape <- gbar^2/var(gen)

gamgen <- qgamma(q, scale=gbar/gamshape, shape=gamshape)

print(mean(gamgen))

print(sd(gamgen))

dname <- "Single-gamma approximation"
dgen <- gamgen

