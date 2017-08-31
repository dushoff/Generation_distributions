rho <- seq(0.0, xmax, length.out=101)

plot(rho, EulerCurve(gbar/rho, gen)
     , type="l"
     , ylim = c(1, ymax)
     , xlab = expression(Relative~length~of~generation~interval~(rho))
     , ylab = "Reproductive number"
     , bty = "l"
)

ltyv <- c(2, 4)

lines(rho, GammaCurve(1/gam_param$moment$shape, rho), lty=2)
lines(rho, GammaCurve(1/gam_param$mle$shape, rho), lty=4)

points(rho_eff, Reff, pch=c(19, 17))
curve(1+x, add=TRUE, col="blue", lty=3)
curve(exp(x), add=TRUE, col="blue", lty=3)
