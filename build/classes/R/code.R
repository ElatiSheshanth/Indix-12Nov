setwd('/Volumes/Backup/')
source('add meta.R')
source('remove meta.R')
x1 = fileSnapshot(path = "Dataset/")
x1 = data.frame(x1$info)
x1 = data.frame('X'=rownames(x1),x1[1:ncol(x1)],stringsAsFactors = F)
if (file.exists('snap')){
  x2 = read.csv('snap',stringsAsFactors = F)
}else{
    x2 <- x1[x1$X=='',]
  }
rownames(x2) <- x2$X

for(i in 1:nrow(x1)){
  temp = which(x1$x[i] %in% x2$X)
  if(length(temp)>0){
    if(!(x1$mtime[i]==x2$mtime[temp])){
      #modified <- append(modified,x1$X[i])
      delete_meta(x1$X[i])
      add_meta(x1$X[i])
    }
  } else{
    #added <- append(added,x1$X)
    add_meta(x1$X[i])
  }
}
#if(nrow(x2>0)){
#for(i in 1:nrow(x2)){
#  if(!(x2$X[i] %in% x1$X)){
#    #deleted <- append(deleted,x2$X[i])
#    delete_meta(x1$X)
#  }
#}}

write.csv(x1,'snap')





