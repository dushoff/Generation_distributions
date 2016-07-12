
par(cex=1.5)
plot(rho, 1+rho
	, type="l"
	, ylim=c(1, 5)
	, xlab = "Exponential growth rate (per month)"
	, ylab = "Effective reproductive number R"
)

curve((1+x/2)^2, add=TRUE)
curve((1+x/4)^4, add=TRUE)
curve(exp(x), add=TRUE)
