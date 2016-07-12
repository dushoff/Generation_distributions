oldfunhist = function(x, f, parms=NULL , finv=NULL, means=TRUE)
{
	zones=matrix(c(2,0,1,3), ncol=2, byrow=TRUE)
	layout(zones, widths=c(4/5,1/5), heights=c(1/5,4/5))

	y <- f(x, parms)

	xhist = hist(x, plot=FALSE)
	yhist = hist(y, plot=FALSE)

	top = max(c(xhist$counts, yhist$counts))

	xs <- seq(min(x), max(x), length.out=101)
	ys = f(xs, parms)

	par(mar=c(3,3,1,1))
	plot(xs, ys , type="l", yaxt="n", xlim=c(0, 40))

	abline(v=mean(x), lwd=2)
	if(means){
		abline(v= finv(mean(y), parms), col="red", lwd=2)
		abline(h=mean(y), col="red", lwd=2)
	}

	par(mar=c(0,3,1,1))
	barplot(xhist$counts, axes=FALSE, ylim=c(0, top), space=0)

	par(mar=c(3,0,1,1))
	barplot(yhist$counts,
		axes=FALSE, xlim=c(0, top), space=0, horiz=TRUE)
	# par(oma=c(3,3,0,0))
}

