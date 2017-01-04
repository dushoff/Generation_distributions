library(ggplot2); theme_set(theme_bw())
library(dplyr)
library(tidyr)
source("euler.R")

nq <- 10000
q <- (2*(1:nq)-1)/(2*nq)

rho <- seq(0.02, 1.0, by=0.02)

get_generation <- function(ikappa = 1,
                           lkappa = 1,
                           ibar = 1,
                           lbar = 2,
                           seed = 101) {
    if(!is.null(seed)) set.seed(seed)
    
    ishape <- 1/ikappa
    lshape <- 1/lkappa
        
    ii <- qgamma(q, scale = ibar/ishape, shape=ishape)
    
    inf <- sample(ii, size=nq, replace=TRUE, prob=ii/sum(ii))
    
    lat <- qgamma(q, scale = lbar/lshape, shape = lshape)
    
    gen <- runif(nq, min=lat, max=lat+inf)
    return(gen)
}

get_gamgen <- function(gen){
    gbar <- mean(gen)
    
    gamshape <- gbar^2/var(gen)
    
    gamgen <- qgamma(q, scale=gbar/gamshape, shape=gamshape)
    
    return(gamgen)
}

compare_gen <- function(ikappa = 1, lkappa = 1){
    gen <- get_generation(ikappa = ikappa, lkappa = lkappa)
    gamgen <- get_gamgen(gen)
    data.frame(
        rho = rho,
        KW = EulerCurve(1/rho, gen),
        gamma = EulerCurve(1/rho, gamgen),
        ikappa = ikappa,
        lkappa = lkappa
    )
}

ikappa <- lkappa <- c(0.25, 1, 4)

m_inf <- Map(compare_gen, ikappa, 1)
m_lat <- Map(compare_gen, 1, lkappa)

sL <- list(inf = m_inf, lat = m_lat) %>%
    lapply(function(x) bind_rows(x, .id = "run")) %>%
    bind_rows(.id = "type") %>%
    gather(key, value, -ikappa, -lkappa, -rho, -type, -run) %>%
    as_data_frame

ggplot(sL, aes(rho, value, group = interaction(ikappa, lkappa, key))) +
    geom_line(aes(col = key, lty = run), lwd = 0.7) +
    scale_linetype_discrete(name = "kappa", labels = c(0.25, 1, 4)) +
    scale_colour_manual(values = c("black", "blue")) +
    facet_wrap(~type)
