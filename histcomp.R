par(cex=1.5)

print(hist(dgen
	, probability=TRUE
	, breaks=20
	, main=dname
	, xlab="Generation interval (days)"
	, xlim=c(0, 80)
	, ylim=c(0, 0.06)
))
