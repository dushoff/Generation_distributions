approx_gamma <- function(x, nq = 10000){
    q <- (2*(1:nq)-1)/(2*nq)
    
    gbar <- mean(x)
    gamshape <- gbar^2/var(x)
    gamgen <- qgamma(q, scale=gbar/gamshape, shape=gamshape)
    return(gamgen)
}

sample_generation <- function(gen, n = 100, trial = 100){
    rho <- seq(0.1, 2.0, by=0.1)
    
    gam_list <- (1:trial
        %>% lapply(function(x) sample(gen, n, replace = TRUE))
        %>% lapply(approx_gamma)
        %>% lapply(function(x) EulerCurve(mean(x)/rho, x))
    )
    gam_mat <- do.call(cbind, gam_list)
    
    return(data.frame(
        rho = rho
        , mean = rowMeans(gam_mat)
        , lwr = apply(gam_mat, 1, quantile, 0.025)
        , upr = apply(gam_mat, 1, quantile, 0.975)
    ))
}
