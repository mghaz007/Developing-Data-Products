
# 
getlambda<-function(isotope) {
  switch(isotope,'beryllium-11'=13.81,'carbon-10'=19.29,'dubnium-261'=27.0,'seaborgium-266'=30.0,'dubnium-262'=34.0);
}

#
getremainpercent<-function(initial_amount,isotope,etime) {
  lambda<-getlambda(isotope)
  lambda<-log(2)/lambda;
  x<-initial_amount*exp(-lambda * etime )
  x
}

getplot<-function(etime){
  
  x<-c(13.81, 19.29, 27.0, 30.0, 34.0)
  x<-log(2)/x;
  x2<-exp(-etime * x )*100
  y<-c('beryllium-11','carbon-10','dubnium-261','seaborgium-266', 'dubnium-262')
  z<-as.data.frame(cbind(cbind(x,x2),y))
  colnames(z)<-c('Time','PercentRemain','Isotope')
   
  z$PercentRemain<-as.numeric(as.character(z$PercentRemain))
  z$color<-ifelse(z$PercentRemain>=100,'green','red')
  
  par(las=2) # make label text perpendicular to axis
  par(mar=c(5,8,4,2)) # increase y-axis margin.
  
  bp<-barplot(z$PercentRemain,horiz=TRUE,names.arg=z$Isotope,col=z$color,cex.names=0.6,xlim=c(0,100))
  
  bp<-text(3, 0.75, paste(formatC((round(z[1,2],2)),2,format='f'),'%') ,col = 'white',cex=0.8)
  bp<-text(3, 1.85, paste(formatC((round(z[2,2],2)),2,format='f'),'%') ,col = 'white',cex=0.8)
  bp<-text(3, 3.05, paste(formatC((round(z[3,2],2)),2,format='f'),'%') ,col = 'white',cex=0.8)
  bp<-text(3, 4.25, paste(formatC((round(z[4,2],2)),2,format='f'),'%') ,col = 'white',cex=0.8)
  bp<-text(3, 5.50, paste(formatC((round(z[5,2],2)),2,format='f'),'%') ,col = 'white',cex=0.8)
  bp<-text(3, 6.65, paste(formatC((round(z[6,2],2)),2,format='f'),'%') ,col = 'white',cex=0.8)
  bp<-text(3, 7.90, paste(formatC((round(z[7,2],2)),2,format='f'),'%') ,col = 'white',cex=0.8)
  
  bp
}

shinyServer(
  function(input, output) {
    
    output$myInitialAmount<-renderPrint(cat({input$initial_amount}))
    output$myIsotope<-renderPrint(cat({input$isotope}))
    output$myTime<-renderPrint(cat({input$etime}))
    output$myRemainPercent<-renderPrint(cat({getremainpercent(input$initial_amount,input$isotope,input$etime)}))
    output$myplot<-renderPlot({getplot(input$etime)})
  }
)