setwd('/Volumes/Backup/')
library(data.table)

query <- function(q, mini, maxi){
  mini <- as.numeric(mini)
  maxi <- as.numeric(maxi)
  file1 <- list.files('Dataset1/')
  sol <- data.table('V1'=character(), 'V2'=character(),'V3'=character(),
                    'V4'=integer(), 'V5'=integer(), 'V6'=character(),
                    'V8'=numeric())
  for(files in file1){
    print(files)
    df <- fread(paste('Dataset1/',files,sep=''),select = c(1,2,3,4,5,6,8))
    colnames(df) <- c('V1','V2','V3','V4','V5','V6','V8')
    df <- subset(df, V8>mini & V8<maxi)
    sol <- rbind(sol,subset(df,grepl(q,V2)))
    print (sol)
  }
  library(rjson)
  fn <- as.numeric(readLines('request'))
  write(fn+1,'request')
  fn <- paste('solution_',fn,'.json',sep='')
  write(toJSON(unname(split(sol, 1:nrow(sol)))),fn)
  print(fn)
}