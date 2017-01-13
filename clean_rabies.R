
clean_rabies <- function(df){
    df2 <- as.character(unlist(df))
    df2 <- df2[!is.na(df2)]
    
    df2 <- gsubfn("week", "* 7", df2)
    df2 <- gsubfn("month", "* 30", df2)
    df2 <- gsubfn("day", "", df2)
    df2 <- gsubfn("s", "", df2)
    
    plus <- which(grepl("plu",df2))
    if(length(plus) > 0){
        df2[plus-1] <- paste(df2[plus-1], gsubfn("plu", "+", df2[plus]))
        df2 <- df2[-plus]
    }
    
    res <- rep(NA, length(df2))
    
    for(i in 1:length(df2)){
        val <- as.numeric(eval(parse(text = df2[i])))
        if(val < 0){
            tmp <- gsub("-", "+", df2[i])
            tmp2 <- gsub("\\*", ")/2 *", tmp)
            if(tmp2 == tmp){
                tmp2 <- paste0(tmp2, ")/2")
            }
            tmp <- paste0("(", tmp2)
            new_val <- as.numeric(eval(parse(text = tmp)))
            res[i] <- new_val
        }else{
            res[i] <- val
        }
    }
    return(floor(res))
}
