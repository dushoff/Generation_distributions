library(bbmle)
library(dplyr)

gbar <- mean(gen)

if(!exists("breaks")){
    breaks <- 31
}

if(!exists("plot_hist")){
    plot_hist <- TRUE
}

if(exists("sgen")){
    hgen <- sgen
}else{
    hgen <- gen
}

gam_param <- compare_gamma(hgen
    , plot = plot_hist
    , main = NULL
    , xlab = "Generation interval (days)"
    , breaks = breaks
)
