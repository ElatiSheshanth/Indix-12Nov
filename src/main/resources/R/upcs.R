setwd('/Volumes/Backup/')
library(data.table)
upcs <- function(upc){
  file1 <- list.files('Dataset1/')
  sol <- data.table('V1'=character(), 'V2'=character(),'V3'=character(),
                    'V4'=integer(), 'V5'=integer(), 'V6'=character(),
                    'V8'=numeric())
  for(files in file1){
    df <- fread(paste('Dataset1/',files,sep=''),select = c(1,2,3,4,5,6,8))
    colnames(df) <- c('V1','V2','V3','V4','V5','V6','V8')
    sol <- rbind(sol,subset(df,V3==upc))
  }
  library(rjson)
  fn <- as.numeric(readLines('request'))
  write(fn+1,'request')
  fn <- paste('solution_',fn,'.json',sep='')
  write(toJSON(unname(split(sol, 1:nrow(sol)))),fn)
  print(fn)
}