library(emdbook)

ran = c(0.25, 2)

KW <- function(x, y){
    return(x^2+y^2)
}

cc <- curve3d(KW(x, y)
	, xlim = ran
	, ylim = ran
	, n = 51
	, sys3d = "contour"
	, log = "xy"
)

cc <- curve3d(KW(x, y)
	, xlim = ran
	, ylim = ran
	, n = 51
	, sys3d = "contour"
	# , log = "xy"
)

warnings()
