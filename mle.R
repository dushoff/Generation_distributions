gammanll <- function(data, shape, scale){
    -sum(dgamma(data, shape = shape, scale = scale, log = TRUE))
}

mle3 <- function(data, start, ...){
    mle2(gammanll, start = start, data = list(data = data), ...)
}

compare_gamma <- function(data, ...){
    x <- data
    
    q <- seq(0.1, max(x), by = 0.1)
    
    xbar <- mean(x)
    gamshape <- xbar^2/var(x)
    gamscale <- xbar/gamshape
    dgam_approx <- dgamma(q, scale=gamscale, shape=gamshape)
    coef_list_approx <- list(shape = gamshape, scale = gamscale)
    
    m0 <- mle3(x, start = coef_list_approx)
    coef_list_mle <- arg_list <- as.list(coef(m0))
    arg_list$x <- q
    dgam_mle <- do.call(dgamma, arg_list)
    
    hist(x, freq = FALSE, ...)
    lines(q, dgam_approx, col = "red")
    lines(q, dgam_mle, col = "blue", lty = 2)
    
    invisible(list(
        momont = coef_list_approx
        , mle = coef_list_mle
    ))
}
