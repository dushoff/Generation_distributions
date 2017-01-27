library(dplyr)
library(ggplot2); theme_set(theme_bw())
cbPalette <- c("#0072B2", "#D55E00")

n_vec <- c(50, 200, 500)

fn <- "lognormal_sample.rda"

if(file.exists(fn)){
    load(fn)
}else{
    arg_list <- list(moment = FALSE, MLE = TRUE)
    samp <- (arg_list 
        %>% lapply(function(x) lapply(n_vec, function(i) sample_generation(gen, n = i, trial = 100, MLE = x, seed = 101)))
    )
    save("samp", file = fn)
}

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
    , mean = Reff
)

gbar <- mean(gen)
rho <- seq(0.1, 2.0, by=0.1)

true_df <- data.frame(
    rho = rho
    , mean = EulerCurve(gbar/rho, gen)
)

## gamma approximation works well even with low number of samples (50)

print(ggplot(bind_df, aes(rho, mean))
    + geom_line(aes(col = type)) 
    + geom_ribbon(aes(ymin = lwr, ymax = upr, fill = type), alpha = 0.15)
    + geom_point(data = point_df)
    + geom_line(data = true_df, lty = 4)
    + stat_function(fun = function(x) x + 1, lty = 2)
    + stat_function(fun = exp, lty = 2)
    + facet_wrap(~n, nrow = 1)
    + scale_x_continuous(expand = c(0, 0))
    + theme(panel.spacing.x = grid::unit(0, "lines"))
    + scale_color_manual(values=cbPalette)
    + scale_fill_manual(values=cbPalette)
)
