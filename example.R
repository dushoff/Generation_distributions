
# par(mfrow = c(1, 3))

source("lognormal.R")
source("gamma.R")
source("euler.R")
source("WHO.R")
source("EbolaCurve.R")

title(main = "Ebola")

source("SARS.R")
source("gamma.R")
source("EbolaCurve.R")

title(main = "SARS")

source("Flu.R")
source("gamma.R")
source("EbolaCurve.R")

title(main = "Flu")

source("clean_rabies.R")
source("Rabies.R")
source("gamma.R")
source("SARSCurve.R")
title(main = "Rabies")

rho_eff <- gbar * 0.0041
source("EbolaCurve.R")
title(main = "Rabies")
