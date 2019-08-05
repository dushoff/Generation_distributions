
library(dplyr)
library(tidyr)
library(ggplot2)
theme_set(theme_bw(base_size=20))

D <- 5
tmax <- 20
shapes <- 2^(-1:5)
numPoints <- 301

t <- seq(0, tmax, length.out=numPoints)

for(s in shapes){
	df <- data.frame(t=t
		, inf = dgamma(t, shape=s, scale=D/s)
		, wait = (1 - pgamma(t, shape=s, scale=D/s))/D
	) %>% gather("dist", "density", -t)
	print(ggplot(df, aes(t, density, color=dist))
		+ geom_line()
		+ ggtitle(paste("kappa =", 1/s))
	)
}
