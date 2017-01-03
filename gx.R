library(ggplot2); theme_set(theme_bw())
library(tidyr)

rmax <- 3
rho <- seq(0, rmax, length.out=101)
kappa <- rev(c(0, 1/4, 1/2, 1))

framePlot <- function(f){
	print(
		ggplot(f, aes(x=rho, y=R, linetype=kappa))
		+ geom_line()
		+ xlab("Interval")
		+ ylab("Effect")
		+ ylim(c(1, 10))
		+ scale_linetype_discrete(
			labels=as.numeric(kappa)
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
	ggplot(gxn, aes(x=rho, y=R, linetype=kappa, color=type))
	+ geom_line()
	+ xlab(expression(rho))
	+ ylab("Effect")
	+ ylim(c(1, 8))
	+ scale_linetype_discrete(
		labels=as.numeric(kappa)
	)
	+ geom_segment(aes(x = 0, xend=rmax, y = 1, yend = rmax+1) , color="black")
)

# framePlot(gx)
# framePlot(gn)
# framePlot(gg)
