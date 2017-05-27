xmax <- 1.5
ymax <- exp(xmax)

dtype <- "empirical"
dname <- "Rabies"

## Rabies blowup; need to refactor all of this!
# xmax <- 4
# ymax <- exp(xmax)/4

lat <- inc$val
lat<- lat[!is.na(lat)]

ii <- inf$val
ii <- ii[!is.na(ii)]

## rabies reproduction number?
Reff <- c(1.06, 1.32)
