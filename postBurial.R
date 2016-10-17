source("lognormal.R")
source("gamma.R")
source("euler.R")
source("WHO.R")
source("EbolaCurve.R")

btime <- 4
bb <- qexp(q, rate = 1/btime)
bury <- sample(bb, size = nq, replace = TRUE, prob = bb/sum(bb))

postBurial <- runif(nq/2, min = lat + inf, max = lat + inf + bury)

post.gen <- c(gen, postBurial)
post.gbar <- mean(post.gen)

post.gamshape <- post.gbar^2/var(post.gen)

post.gamgen <- qgamma(q, scale=post.gbar/post.gamshape, shape=post.gamshape)

lines(rho, EulerCurve(post.gbar/rho, post.gamgen), col="red", lty = 2)
