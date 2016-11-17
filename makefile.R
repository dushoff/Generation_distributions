## not sure how to work with makefile
## I think I can figure out but I didn't want to break anything
## Here's a fake makefile that sources all the files...

par(mfrow = c(1, 3))

source("lognormal.R")
source("gamma.R")
source("euler.R")
source("WHO.R")
source("EbolaCurve.R")

title(main = "Ebola")

source("SARS.R")
source("gamma.R")
source("SARSCurve.R")

title(main = "SARS")

source("Flu.R")
source("gamma.R")
source("SARSCurve.R")

title(main = "Flu")
