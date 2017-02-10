hist(gen, freq = FALSE, breaks = 51)
d <- seq(0, max(gen), by = 0.1)
lines(d, dnorm(d, mean = gbar, sd = gsd), col = "red")
lines(d, dgamma(d, scale=gbar/gamshape, shape=gamshape), col = "blue")
