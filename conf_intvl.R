tst_vctr <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,40)

t_test <- t.test(tst_vctr)

ci_low  <- t_test$conf.int[1]
ci_high <- t_test$conf.int[2]

ci_low  
ci_high
 