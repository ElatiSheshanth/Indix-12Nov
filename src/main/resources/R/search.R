args = commandArgs(trailingOnly=T)
setwd('/Volumes/Backup/')
source('pid.R')
source('upcs.R')
source('category.R')
source('query.R')
options( warn = -1 )
print(args)
if(args[1]=="1"){
  pid(args[2])
} else if(args[1]=='2'){
  upcs(args[2])
} else if(args[1]=='3'){
  category(args[2])
}else if(args[1]=='4'){
  query(args[2],args[3],args[4])
} else if(args[1]=='5'){
  query(args[2],args[3],Inf)
} else if(args[1]=='6'){
  query(args[2],-Inf,args[3])
}