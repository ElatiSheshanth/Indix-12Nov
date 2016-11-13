setwd('/Volumes/Backup/')
library(data.table)

add_meta <- function(file1){
  df <- readLines(paste('Dataset/',file1,sep=''))
  df <- gsub('""',"",df)
  write(df,paste('Dataset1/',file1,sep=''))
  rm(df)
  gc(reset=T)
  df <- fread(paste('Dataset1/',file1,sep=''),select = c(1,4,5,8))
  colnames(df) <- c('V1','V4','V5','V8')
  first_pid <- unique(substr(df$V1,1,3))
  write.csv(first_pid,paste('first_pid/',file1,sep = ''))
  last_pid <- unique(substr(df$V1,30,32))
  write.csv(last_pid,paste('last_pid/',file1,sep = ''))
  cat_id <- unique(df$V4)
  write.csv(cat_id,paste('cat_id/',file1,sep = ''))
  store_id <- unique(df$V5)
  write.csv(store_id,paste('store_id/',file1,sep = ''))
  #time_st <- as.POSIXct(df$V7/1000,origin = '1970-01-01')
  if (file.exists('price/price.csv')){
  price <- fread('price/price.csv')
  }else{
    price <- data.frame('file'=character(),'min'=numeric(),'max'=numeric())
  }
  V8 <- na.omit(df$V8)
  price <- rbind(price,data.frame('file'=file1,'min'=min(V8),'max'=max(V8)))
  write.csv(price,'price/price.csv',row.names = F)
}