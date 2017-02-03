gen_density <- hist(hgen, plot = FALSE, breaks = breaks)$density

legend(0.65 * max(hgen), 0.9 * max(gen_density), c("moment", "MLE"), lty = c(2, 3))
