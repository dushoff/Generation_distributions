gamgen_list <- (gam_param
    %>% lapply(function(x) return(append(x, list(p = q))))
    %>% lapply(function(x) return(list(gamgen = do.call(qgamma, x))))
)

rho <- seq(0.0, xmax, length.out=101)

plot(rho, EulerCurve(gbar/rho, gen)
     , type="l"
     , ylim = c(1, ymax)
     , xlab = "Rescaled exponential growth rate" 
     , ylab = "R"
     , bty = "l"
)

ltyv <- c(2, 4)

for(i in 1:2)
    with(gamgen_list[[i]], lines(rho, EulerCurve(gbar/rho, gamgen), lty = ltyv[i]))

points(rho_eff, Reff, pch=19)
curve(1+x, add=TRUE, col="blue", lty=3)
curve(exp(x), add=TRUE, col="blue", lty=3)
