R <- seq(1, 3, by=0.01)
G0 <- R^2-1

par(cex=1.5)
plot(R, G0
	, type = "l"
	, xlab = "Reproductive number"
	, ylab = "Generation time"
	, main = "Characteristic time of spread"
)
for (m in (1:4)/2){
	lines(R, m*G0)
}

lines(R, G0, col="blue")

arrows(1.5, 5, 2, 2, col="red")
