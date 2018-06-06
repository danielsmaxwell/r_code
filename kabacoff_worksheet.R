options(digits=2)

Student <- c("John Davis", "Angela Williams", "Bullwinkle Moose", "David Jones",
             "Janice Markhammer", "Cheryl Cushing", "Reuven Ytzrhak", "Greg Knox",
             "Joel England","Mary Rayburn")

Math    <- c(502, 600, 412, 358, 495, 512, 410, 625, 573, 522)
Science <- c(95, 99, 80, 82, 75, 85, 80, 95, 89, 86)
English <- c(25, 22, 18, 15, 20, 28, 15, 30, 27, 18)

roster   <- data.frame(Student, Math, Science, English, stringsAsFactors = FALSE)

z_scores <- scale(roster[,2:4])
score    <- apply(z_scores, 1, mean)
roster   <- cbind(roster, score)

idx <- quantile(score, c(.8, .6, .4, .2))

roster$grade[score >= idx[1]] <- "A"
roster$grade[score < idx[1] & score >= idx[2]] <- "B"
roster$grade[score < idx[2] & score >= idx[3]] <- "C"
roster$grade[score < idx[3] & score >= idx[4]] <- "D"
roster$grade[score >= idx[4]] <- "F"








