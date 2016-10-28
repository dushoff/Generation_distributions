library(ggplot2); theme_set(theme_bw())
library(reshape2)

delta <- seq(0.01, 2, 0.01)
## generalized exponential
exp_X <- function(delta, n){
    (delta/n + 1)^n
}

N <- function(delta, n){
    delta * exp_X(delta, n)/(exp_X(delta, n) - 1)
}

df <- sapply(c(1, 4, 9), function(n) N(delta, n))
df <- as.data.frame(cbind(delta= delta, df))

mL <- melt(df, id.vars = "delta")

ggplot(mL, aes(delta, value)) +
    geom_line(aes(lty = variable)) +
    xlab(bquote(paste(delta, " (Duration of infectious period scaled by ", lambda, ")"))) +
    ylab("N") +
    scale_linetype_discrete(
        name = "n"
        , label = c("1", "4", "9")
    )
