library(dplyr)
library(ggplot2); theme_set(theme_bw())

n_vec <- c(50, 200, 500, 1000)

samp <- lapply(n_vec, function(x) sample_generation(gen, n = x, trial = 100))

samp_df <- (samp 
    %>% setNames(n_vec)
    %>% bind_rows(.id = "n")
)
samp_df$n <- factor(samp_df$n, labels = paste0("n = ", n_vec), levels = n_vec)

point_df <- data.frame(
    rho = rho_eff
    , mean = Reff
)

## gamma approximation works well even with low number of samples (50)

print(ggplot(samp_df, aes(rho, mean))
    + geom_line() 
    + geom_ribbon(aes(ymin = lwr, ymax = upr), alpha = 0.2)
    + geom_point(data = point_df)
    + stat_function(fun = function(x) x + 1, col = "blue", lty = 2)
    + stat_function(fun = exp, col = "blue", lty = 2)
    + facet_wrap(~n, nrow = 1)
    + scale_x_continuous(expand = c(0, 0))
    + theme(panel.spacing.x = grid::unit(0, "lines"))
)