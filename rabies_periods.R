
## Our four-year cycle has 1461 days and 48 months
ufun <- function(df){
	mon <- 487/16
	utab <- data.frame(
		units = c("Day", "Week", "Month")
		, uval = c(1, 7, mon)
	)
	vf <- merge(df, utab)
	return (vf)
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

inc <- ufun(inc)
inf <- ufun(inf)

inc$val <- inc$num*inc$uval


mean(inc$val)
sd(inc$val)
