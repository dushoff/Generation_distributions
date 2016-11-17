ptrap <- function(x, t_a = 4, t_b = 7, t_c = 11, t_d = 14){
    
    t_I <- (t_d + t_c - t_b - t_a)/2

    sapply(x, function(x){
        if(x <= t_a){
            0
        }else if(x <= t_b){
            (x-t_a)^2/(2 * (t_b - t_a) * t_I)
        }else if(x <= t_c){
            (x-t_b)/t_I + (t_b - t_a)/(2 * t_I)
        }else if(x <= t_d){
            1 -(t_d - x)^2/(2 * (t_d - t_c) * t_I)
        }else{
            1
        }
    })
}

qtrap <- function(x, t_a = 4, t_b = 7, t_c = 11, t_d = 14){
    
    t_I <- (t_d + t_c - t_b - t_a)/2
    
    sapply(x, function(x){
        if(x <= 0){
            -Inf
        }else if(x <= (t_b - t_a)/(2 * t_I)){
            sqrt(2 * (t_b - t_a) * t_I * x) + t_a
        }else if(x <= (2 * t_c - t_b - t_a)/(2 * t_I)){
            t_I * x - (t_b - t_a)/2 + t_b
        }else if(x < 1){
            t_d - sqrt(2 * (t_d - t_c) * t_I * (1 - x))
        }else{
            Inf
        }
    })
}
