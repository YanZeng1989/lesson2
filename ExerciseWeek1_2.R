######function of check whether it is leap year.
year <- 2000
is.leap<-function(year){
  if (is.character(year)){
    stop("argument of class numeric expected")
  }
  if (year<=1600){
    warning("1581 is out of the valid range")
  }
  if (year%%100==0){
    if (year%%400==0){
      out=T    
    }
    else if (year%%400!=0){
      out=F
    }     
  }else if(year%%4==0){
    out=T
  }
  else if (year%%4!=0){
    out=F
  }
return(out)
}
##call the function
is.leap(1581)
is.leap(year = 1996)
is.leap("john")