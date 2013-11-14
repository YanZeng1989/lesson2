######Exerciseweek2_2 of Yan Zeng

# Load the required libraries
setwd("I:/Applied_R")
library(rasta)
# Import the example data
data(taravao)
data(taravao2)

###make the mask
Mask<-function(data){
  cloud<-calc(data[[9]],fun=QA2cloud)
  cloud[cloud==0]<-NA   
  datanew<-dropLayer(x=data,i=9)
  datanew[cloud==1]<-NA
  datanew <- projectRaster(from=datanew, crs='+proj=longlat')
  plotRGB(datanew,4,5,3)
  return(datanew)
}
##calculate the mean of each band and outputis in outputDictionary
MeanofImage<-function(time1,time2){
  for(i in 1:8){
    out<-mean(time1[[i]],time2[[i]],na.rm=TRUE)
    writeRaster(x=out,filename=(paste("outputband",i,".tif",sep="")),format="GTiff",overwrite=TRUE)
  }
  list <- list.files(path=getwd(),full.names=TRUE)
  difStack <- stack(list) 
  result<-writeRaster(x=difStack, filename='difStack.grd', datatype='INT2S')
  return(result)    
}


ComposeLandsat<-function(data1,data2){
  dir<-getwd()
  subDir <- "outputDirectory"
  dir.create(file.path(dir, subDir), showWarnings = FALSE)
  setwd(file.path(dir, subDir))
  
  Data1<-Mask(data1)
  Data2<-Mask(data2)
  MeanofImage(Data1,Data2)  
}

# Run the compositing function
taravaoComposit <- ComposeLandsat(taravao, taravao2)
# Visualize the results
plotRGB(taravaoComposit, 4, 5, 3)
             