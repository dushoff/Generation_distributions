gammanll <- function(data, shape, scale){
    return(-sum(dgamma(data, shape = shape, scale = scale, log = TRUE)))
}

gammaMLE <- function(data, start, ...){
    fit <- mle2(gammanll, start = start, data = list(data = data), ...)
	 if(conv <- fit@details$convergence != 0){
		 stop(paste0("Convergence code", conv, "in gammaMLE"))
	 }
	 return(fit)
}

compare_gamma <- function(data, plot = TRUE, MLE = TRUE, ...){
    x <- data
    
    q <- seq(0.01, max(x), by = 0.01)
    
    xbar <- mean(x)
    gamshape <- xbar^2/var(x)
    gamscale <- xbar/gamshape
    dgam_approx <- dgamma(q, scale=gamscale, shape=gamshape)
    coef_list_approx <- list(shape = gamshape, scale = gamscale)
    
    res <- list(moment = coef_list_approx)
    
    if(MLE){
        m0 <- gammaMLE(x, start = coef_list_approx)
        coef_list_mle <- arg_list <- as.list(coef(m0))
        arg_list$x <- q
        dgam_mle <- do.call(dgamma, arg_list)
        res$mle <- coef_list_mle
    }
    
    if(plot){
        hist(x, freq = FALSE, ...)
        lines(q, dgam_approx, lty = 2)
        if(MLE)
            lines(q, dgam_mle, lty = 4)
    }
    
    invisible(res)
}
