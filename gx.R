library(ggplot2); theme_set(theme_bw())
library(tidyr)

rho <- seq(0, 3, length.out=101)
kappa <- c(1, 1/2, 1/4, 0)

outer(rho, kappa, function(x, y){return(vgenX(x, kappa=y))})

