
comb_data <- data.frame(
    inc = inc$val
    , inf = inf$val
)

clean_data <- with(comb_data, comb_data[!is.na(inf) & !is.na(inc), ])

## I don't think these look correlated...
with(clean_data, cor.test(inc, inf))
plot(clean_data)
