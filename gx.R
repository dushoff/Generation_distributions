library(ggplot2); theme_set(theme_bw())
library(tidyr)

rho <- seq(0, 3, length.out=101)
kappa <- c(0, 1/4, 1/2, 1)


framePlot <- function(m){
	f <- (data.frame(rho, m=m)
		%>% gather(kappa, R, m.1:m.4)
	)
	knames <- unique(f$kappa)
	print(f)

	print(
		ggplot(f, aes(x=rho, y=R, linetype=kappa))
		+ geom_line()
		+ xlab("Interval")
		+ ylab("Effect")
		+ ylim(c(1, 10))
		+ scale_linetype_discrete(
			breaks=knames, labels=as.numeric(kappa)
		)
	)
}

gx <- outer(rho, kappa, function(x, y){return(genX(x, kappa=y))})
gn <- outer(rho, kappa, function(x, y){return(genN(x, kappa=y))})

framePlot(gx)
framePlot(gn)
