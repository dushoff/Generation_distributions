library(ggplot2); theme_set(theme_bw())
cbPalette <- c("#0072B2", "#D55E00")

## gamma approximation works well even with low number of samples (50)

print(ggplot(bind_df, aes(rho, median))
    + geom_line(aes(col = type, lty = type)) 
    + geom_ribbon(aes(ymin = lwr, ymax = upr, fill = type), alpha = 0.15)
    + geom_point(data = point_df)
    + geom_line(data = true_df, lty = 1)
    + stat_function(fun = function(x) x + 1, lty = 3)
    + stat_function(fun = exp, lty = 3)
    + facet_wrap(~n, nrow = 1)
    + scale_x_continuous(expression(Relative~length~of~generation~interval~(rho)), expand = c(0, 0))
    + scale_y_continuous("Reproductive number")
    + theme(panel.spacing.x = grid::unit(0, "lines"))
    + scale_linetype_manual(values = c(4, 2))
    + scale_color_manual(values=cbPalette)
    + scale_fill_manual(values=cbPalette)
    + theme(
        strip.background = element_blank(),
        panel.grid.minor = element_blank()
    )
)

