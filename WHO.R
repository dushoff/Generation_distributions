## Points corresponding to WHO estimates
Ghat <- 15.3 ## you are scaling by mean generation time here
Reff <- c(1.81, 1.51, 1.38)
doub <- c(15.7, 23.6, 30.2)

rho_eff <- Ghat*log(2)/doub

print(data.frame(rho_eff, Reff))
