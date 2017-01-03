library(ggplot2); theme_set(theme_bw())
library(tidyr)

rho <- seq(0, 3, length.out=101)
kappa <- c(0, 1/4, 1/2, 1)

framePlot <- function(f){
	print(
		ggplot(f, aes(x=rho, y=R, linetype=rev(kappa)))
		+ geom_line()
		+ xlab("Interval")
		+ ylab("Effect")
		+ ylim(c(1, 10))
		+ scale_linetype_discrete(
			breaks=unique(kappa)
			, labels=as.numeric(rev(kappa))
		)
	)
}

gx <- funFrame(rho, kappa, genX)
gn <- funFrame(rho, kappa, genN)
gg <- funFrame(rho, kappa, genG)

gx$type <- "E"
gn$type <- "I"
gxn <- rbind(gx, gn)
print(
	ggplot(gxn, aes(x=rho, y=R, linetype=rev(kappa), color=type))
	+ geom_line()
	+ xlab(expression(rho))
	+ ylab("Effect")
	+ ylim(c(1, 10))
	+ scale_linetype_discrete(
		breaks=unique(kappa)
		, labels=as.numeric(rev(kappa))
	)
)

framePlot(gx)
# framePlot(gn)
# framePlot(gg)
