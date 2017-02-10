
gbar <- mean(gen)

gsd <- sd(gen)

normgen <- qnorm(q, mean = gbar, sd = gsd)

print(mean(normgen))

print(sd(normgen))

dname <- "Normal approximation"
dgen <- gamgen
