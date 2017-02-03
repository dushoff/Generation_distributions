gamgen_list <- (gam_param
    %>% lapply(function(x) append(x, list(p = q)))
    %>% lapply(function(x) list(gamgen = do.call(qgamma, x)))
)

rho <- seq(0.0, xmax, length.out=101)

plot(rho, EulerCurve(gbar/rho, gen)
     , type="l"
     , ylim = c(1, ymax)
     , xlab = "Rescaled exponential growth rate" 
     , ylab = "R"
     , bty = "l"
)

for(i in 1:2)
    gamgen_list[[i]]$id <- i

print(
    lapply(gamgen_list, function(x) with(x, lines(rho, EulerCurve(gbar/rho, gamgen), lty = id + 1)))
)

points(rho_eff, Reff, pch=19)
curve(1+x, add=TRUE, col="blue", lty=2)
curve(exp(x), add=TRUE, col="blue", lty=2)
