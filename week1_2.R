library(raster)
vector<-c(1,2,3,4)
vector
r <- raster(nrow=20,ncol=20)
plot(r)
random<-rnorm(n=20)
random
data(cars)
plot(cars)

library(sp)
data(meuse.grid)
coordinates(meuse.grid)=~x+y
proj4string(meuse.grid)<-CRS("+init=epsg:28992")
gridded(meuse.grid)=TRUE
spplot(meuse.grid)
?meuse.grid

vector<-c(2,3,4,5,5,5,65)
vector
vector[vector==3]<-NA
vector
vector[is.na(vector)]<-4
vector[vector%in%c(3,4)]<-NA
vector


##hello function
hello<-function(name){
  if(is.character(name)){
    out<-paste("Hello",name)
  }else if (is.numeric(name)){
    out<-past('hello',name)
    warning ("object of class character expected")
    
  }else{
    stop("object of class character expected")
  }  
  return(out)
  }

hello("world")
hello(r)
hello(5)
################try()
square<-function(x){
  out<-x*x
  return (out)
}
square(3)
out<-c()
list<-list(1,2,3,4,54,5,56)
for (i in 1:length(list)){
  out[i]<-square(list[[i]])
}



out<-c()
list2<-list(1,2,3,4,54,5,56,"djkhgfkjfd")
for (i in 1:length(list2)){
  out[i]<-square(list2[[i]])
}

trysquare<-function(x){
  s<-try(square(x)) 
  return(s)
}

out<-c()
list2<-list(1,2,3,4,54,5,56,"djkhgfkjfd")
for (i in 1:length(list2)){
out[i]<-trysquare(list2[[i]])
}
out