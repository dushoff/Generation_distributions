nq <- 10000
q <- (2*(1:nq)-1)/(2*nq)

fluGen <- data.frame(gen = c(1:11),
                     freq = c(6, 8, 12, 14, 2, 1, 0, 2, 2, 1, 2))

fluGen.freq <- as.vector(rep(fluGen$gen, fluGen$freq))
gen <- fluGen.freq[fluGen.freq < 7 & fluGen.freq > 1] - 0.5

print(mean(gen))
print(sd(gen))

dname <- "Flu"
dgen <- gen

## Flu reproduction number
Reff <- 1.73
rho_eff <- 2.85 * 0.2
