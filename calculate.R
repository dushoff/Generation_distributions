set.seed(628)

nq <- 10000
q <- (2*(1:nq)-1)/(2*nq)

gen <- {
    if (dtype=="emprical") {
        lat <- sample(lat, size=nq, replace = TRUE)
    } else if (dtype=="fitted") {
        lat <- eval(lat, pars)
        ii <- eval(ii, pars)
    }
    inf <- sample(ii, size=nq, replace=TRUE, prob=ii/sum(ii))
    
    runif(nq, min=lat, max=lat+inf)
}

print(gbar <- mean(gen))
print(sd(gen))

