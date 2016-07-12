set.seed(628)

par(cex=1.5)

kap <- 0.4
steps <- 100
r <- seq(0, 2, length.out=steps+1)
mid <- round((steps+2)/2)

G <- c(15, 30, 45)/30

R <- list()

for (i in (1:length(G))){
	R[[i]] <- (1+r*G[[i]]*kap)^(1/kap)
}

lineplot <- function(r, l, top){
	plot(NULL, NULL
		, xlim = range(r)
		, ylim = c(0, top)
		, xlab = "Exponential growth rate (per month)"
		, ylab = "Effective reproductive number R"
	)
	for (Rc in l){ lines(r, Rc)}
}

lineplot(r, R[2], max(R[[3]]))
lineplot(r, R, max(R[[3]]))

lineplot(r, R, max(R[[3]]))
arrows(r[[mid]], R[[2]][[mid]] 
	, x1=c(r[[mid]]+0.5, r[[mid]]-0.3)
	, col=c("red", "blue")
)

lineplot(r, R, max(R[[3]]))
arrows(r[[mid]], R[[2]][[mid]] 
	, y1=c(R[[1]][[mid]], R[[3]][[mid]])
	, col=c("red", "blue")
)

