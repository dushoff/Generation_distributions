dat=c(2,4,0,6,5) 
names(dat)=paste('dpt.',1:5,sep='') 
barplot(dat, horiz=T) 
box() 

par(mar=c(5,2,4,4)) 
barpos<-barplot(-dat,names.arg=rep("",5),axes=FALSE,horiz=TRUE) 
axis(1,at=(-6):0,labels=6:0) 
mtext(names(dat),side=4,at=barpos,line=1) 

