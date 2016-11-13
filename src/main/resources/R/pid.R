setwd('/Volumes/Backup/')
library(data.table)

pid<-function(p_id){
  f_p_id <- substr(p_id,1,3)
  l_p_id <- substr(p_id,30,32)
  file1 <- list.files('first_pid/')
  #file2 <- list.files('last_pid/')
  available_files <- character()
  for(files in file1){
    df1 <- fread(paste('first_pid/',files,sep=''))
    df2 <- fread(paste('last_pid/',files,sep=''))
    if((f_p_id %in% df1$x) &&(l_p_id %in% df2$x)){
      available_files <- append(available_files,files)
      rm(df1,df2)
      gc(reset=T)
    }
  }
  sol <- data.table('V1'=character(), 'V2'=character(),'V3'=character(),
                    'V4'=integer(), 'V5'=integer(), 'V6'=character(),
                    'V8'=numeric())
  for(files in available_files){
    print(files)
    df <- fread(paste('Dataset1/',files,sep=''),select = c(1,2,3,4,5,6,8))
    colnames(df) <- c('V1','V2','V3','V4','V5','V6','V8')
    sol <- rbind(sol, subset(df,V1==p_id))
  }
  library(rjson)
  fn <- as.numeric(readLines('request'))
  fn1 <- fn+1
  fn <- paste('solution_',fn,'.json',sep='')
  write(toJSON(unname(split(sol, 1:nrow(sol)))),fn)
  write(fn1,'request')
  print (fn)
}