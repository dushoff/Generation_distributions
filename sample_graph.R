library(dplyr)
library(bbmle)
library(ggplot2); theme_set(theme_bw())
cbPalette <- c("#0072B2", "#D55E00")

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
rho <- seq(0.1, xmax, by=0.1)

true_df <- data.frame(
    rho = rho
    , median = EulerCurve(gbar/rho, gen)
)

## gamma approximation works well even with low number of samples (50)

print(ggplot(bind_df, aes(rho, median))
    + geom_line(aes(col = type, lty = type)) 
    + geom_ribbon(aes(ymin = lwr, ymax = upr, fill = type), alpha = 0.15)
    + geom_point(data = point_df)
    + geom_line(data = true_df, lty = 1)
    + stat_function(fun = function(x) x + 1, lty = 3)
    + stat_function(fun = exp, lty = 3)
    + facet_wrap(~n, nrow = 1)
    + scale_x_continuous(expand = c(0, 0))
    + theme(panel.spacing.x = grid::unit(0, "lines"))
    + scale_linetype_manual(values = c(4, 2))
    + scale_color_manual(values=cbPalette)
    + scale_fill_manual(values=cbPalette)
)
