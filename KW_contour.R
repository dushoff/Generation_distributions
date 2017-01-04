library(ggplot2)
library(reshape2)
library(dplyr)
library(emdbook)
source("XN.R")

KW_R0 <- function(C, lkappa, ikappa, lbar = 2, ibar = 1){
    r <- 1/C
    genX(lbar * r, lkappa) * genN(ibar * r, ikappa)
}

cc <- curve3d(KW_R0(2, x, y),
              xlim = c(0.1, 10),
              ylim = c(0.1, 10),
              n = 51,
              sys3d = "contour",
              xlab = expression(kappa[E]),
              ylab = expression(kappa[I]))

if(FALSE){
    cc_list <- lapply(c(1, 2, 3), function(C){
        a <<- C
        curve3d(KW_R0(a, x, y),
                xlim = c(0.5, 2),
                ylim = c(0.5, 2),
                n = 51,
                sys3d = "none")})
    
    cc_dat <- cc_list %>%
        lapply(function(data){
            with(data, {
                m <- matrix(z, ncol = length(x))
                dimnames(m) <- list(x, y)
                return(m)
            }) %>% melt
        }) %>%
        bind_rows(.id = "run") %>%
        as_data_frame
    
    ggplot(cc_dat %>% filter(), aes(x = Var1, y = Var2, z = value)) +
        geom_contour() +
        scale_x_log10() +
        scale_y_log10() +
        facet_wrap(~run)
}
