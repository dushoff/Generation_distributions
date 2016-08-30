funZones = function()
{
	zones=matrix(c(2,0,1,3), ncol=2, byrow=TRUE)
	layout(zones, widths=c(4/5,1/5), heights=c(1/5,4/5))
}

funHist = function(x, f, parms=NULL , finv=NULL, means=TRUE, top=NULL)
{
	y <- f(x, parms)

	xhist = hist(x, plot=FALSE)
	yhist = hist(y, plot=FALSE)

	if(is.null(top)) top = max(c(xhist$counts, yhist$counts))

	xs <- seq(min(x), max(x), length.out=101)
	ys = f(xs, parms)

	par(mar=c(3,3,1,1))
	plot(xs, ys , type="l", yaxt="n")

	abline(v=mean(x), lwd=2)

	if(means){
		abline(v= finv(mean(y), parms), col="red", lwd=2)
		abline(h=mean(y), col="red", lwd=2)
	}

	par(mar=c(0,3,1,1))
	barplot(xhist$counts, axes=FALSE, ylim=c(0, top), space=0)

	par(mar=c(3,0,1,1))
	barplot(yhist$counts
		, axes=FALSE
		# , xlim=c(top, 0)
		, space=0, horiz=TRUE
	)
}

### Deprecated version of funHist; still used in talk-panel figures. Fix and eliminate (have them all call funZones once instead)
### Need to figure out why I had that weird par() statement.
funhist = function(x, f, parms=NULL , finv=NULL, means=TRUE, top=NULL)
{
	zones=matrix(c(0,2,3,1), ncol=2, byrow=TRUE)
	layout(zones, widths=c(1/5,4/5), heights=c(1/5,4/5))

	y <- f(x, parms)

	xhist = hist(x, plot=FALSE)
	yhist = hist(y, plot=FALSE)

	top = max(c(xhist$counts, yhist$counts))

	xs <- seq(min(x), max(x), length.out=101)
	ys = f(xs, parms)

	par(mar=c(3,3,1,1))
	plot(xs, ys , type="l", yaxt="n")

	abline(v=mean(x), lwd=2)

	if(means){
		abline(v= finv(mean(y), parms), col="red", lwd=2)
		abline(h=mean(y), col="red", lwd=2)
	}

	par(mar=c(0,3,1,1))
	barplot(xhist$counts, axes=FALSE, ylim=c(0, top), space=0)

	par(mar=c(3,0,1,1))
	barplot(yhist$counts,
		axes=FALSE, xlim=c(top, 0), space=0, horiz=TRUE)
	par(oma=c(3,3,0,0))
}

expfun <- function(x, parms){return(with(parms, exp(-x/Tc)))}
logfun <- function(x, parms){return(with(parms, -Tc*log(x)))}
recip <-  function(x, parms){return(1/x)}
idfun <-  function(x, parms){return(x)}
sqfun <-  function(x, parms){return(x^2)}
rootfun <-  function(x, parms){return(sqrt(x))}
