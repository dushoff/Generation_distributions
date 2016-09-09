leftZones = function()
{
	zones=matrix(c(0,2,3,1), ncol=2, byrow=TRUE)
	layout(zones, widths=c(1/5,4/5), heights=c(1/5,4/5))
}

# Not implemented; or won't work right. The problem is limits and such for the 
# shifted barplot
rightZones = function()
{
	zones=matrix(c(0,2,3,1), ncol=2, byrow=TRUE)
	layout(zones, widths=c(1/5,4/5), heights=c(1/5,4/5))
}

funHist = function(x, f, parms=NULL , finv=NULL, means=TRUE, top=NULL)
{
	# Make histogram information
	y <- f(x, parms)
	xhist = hist(x, plot=FALSE)
	yhist = hist(y, plot=FALSE)

	# Try to make histograms comparable
	if(is.null(top)) top = max(c(xhist$counts, yhist$counts))

	# Make sequences for main plot
	xs <- seq(min(x), max(x), length.out=101)
	ys = f(xs, parms)

	# Main plot with mean line
	par(mar=c(3,3,1,1))
	plot(xs, ys , type="l", yaxt="n")
	abline(v=mean(x), lwd=2)

	# Do we want mean lines for the filtered mean?
	if(means){
		abline(v= finv(mean(y), parms), col="red", lwd=2)
		abline(h=mean(y), col="red", lwd=2)
	}

	# Bottom histogram
	par(mar=c(0,3,1,1))
	barplot(xhist$counts, axes=FALSE, ylim=c(0, top), space=0)

	# Side histogram
	par(mar=c(3,0,1,1))
	barplot(yhist$counts
		, axes=FALSE
		, xlim=c(top, 0)
		, space=0, horiz=TRUE
	)
}

### Old version; nothing wrong with it I guess
funhist = function(x, f, parms=NULL , finv=NULL, means=TRUE, top=NULL)
{
	funZones()
	funHist(x, f, parms, finv, means, top)
}

expfun <- function(x, parms){return(with(parms, exp(-x/Tc)))}
logfun <- function(x, parms){return(with(parms, -Tc*log(x)))}
recip <-  function(x, parms){return(1/x)}
idfun <-  function(x, parms){return(x)}
sqfun <-  function(x, parms){return(x^2)}
rootfun <-  function(x, parms){return(sqrt(x))}
