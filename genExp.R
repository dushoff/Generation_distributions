library(ggplot2); theme_set(theme_bw())
library(tidyr)

rho <- seq(0, 3, length.out=101)

curveTab <- data.frame(rho
	, k1=1+rho
	, k2=(1+rho/2)^2
	, k4=(1+rho/4)^4
	, kx=exp(rho)
)

curveList <- (curveTab
	%>% gather(kappa, R, k1:kx)
)

print(
	ggplot(curveList, aes(x=rho, y=R, linetype=kappa))
	+ geom_line()
	+ xlab(expression(Relative~length~of~generation~interval~(rho)))
	+ ylab(expression(Reproductive~number))
	+ ylim(c(1, 10))
	+ scale_linetype_discrete(
		breaks=rev(c("k1", "k2", "k4", "kx"))
		, labels=rev(c("1", "1/2", "1/4", "0"))
	)
)
