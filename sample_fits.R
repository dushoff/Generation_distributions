library(dplyr)
library(bbmle)

n_vec <- c(50, 200)

arg_list <- list(moment = FALSE, MLE = TRUE)
samp <- (arg_list 
    %>% lapply(function(x) lapply(n_vec, function(i) sample_generation(gen, n = i, trial = 1000, MLE = x, seed = 101)))
)


samp_df <- (lapply(samp, function(x){
    df <- do.call(rbind, x)
    df$n <- rep(n_vec, each = nrow(df)/length(n_vec))
    df$n <- factor(df$n, labels = paste0("n = ", n_vec), levels = n_vec)
    return(df)
}))

bind_df <- (samp_df
    %>% bind_rows(.id = "type")
)

point_df <- data.frame(
    rho = rho_eff
    , median = Reff
)

gbar <- mean(gen)
rho <- seq(0.05, xmax, by=0.05)

true_df <- data.frame(
    rho = rho
    , median = EulerCurve(gbar/rho, gen)
)

