setwd('/Volumes/Backup/')
library(data.table)

delete_meta <- function(file1){
  fn <- paste('first_pid/',file1,sep = '')
  if (file.exists(fn)) file.remove(fn)
  fn <- paste('lasst_id/',file1,sep = '')
  if (file.exists(fn)) file.remove(fn)
  fn <- paste('cat_id/',file1,sep = '')
  if (file.exists(fn)) file.remove(fn)
  fn <- paste('store_id/',file1,sep = '')
  if (file.exists(fn)) file.remove(fn)
  price <- fread('price/price.csv')
  price <- subset(price, file!=file1)
  write.csv(price,'price/price.csv',row.names = F)
}