
## Our four-year cycle has 1461 days and 48 months
    ufun <- function(df){
    	mon <- 487/16
    	utab <- data.frame(
    		units = c("Day", "Week", "Month")
		, uval = c(1, 7, mon)
	)
	df$id <- 1:nrow(df)
	vf <- merge(df, utab, all = TRUE)
	vg <- vf[order(vf$id),]
	return (vg[1:nrow(df),])
}

rdata <- read.csv(input_files[[1]])
inc <- with(rdata, {data.frame(
	num=Incubation.period
	, units = Incubation.period.units
)})
inf <- with(rdata, {data.frame(
	num=Infectious.period
	, units = Infectious.period.units
)})

inf <- ufun(inf)
inf$val <- inf$num*inf$uval
mean(inf$val, na.rm = TRUE)
sd(inf$val, na.rm = TRUE)

inc <- ufun(inc)
inc$val <- inc$num*inc$uval
mean(inc$val, na.rm = TRUE)
sd(inc$val, na.rm = TRUE)
