library(shiny)
library(ggplot2)
# Define server logic required to draw a plot of Sin(t)
shinyServer(function(input, output) {
  
   output$distPlot <- renderPlot({
    t    <- seq(0,4*pi,0.01) # t values to be plot
    
    # draw the plot with the specified parameters
    A <- input$Amplitude
    B <- input$Period
    C <- input$Phase
    D <- input$Shift
        plot(t,A*sin(B*t+C)+D,type='l',xlim=c(0, 4*pi), ylim=c(-6, 6),axes = "FALSE",
         xlab="t", ylab="A Sin(Bt+C) + D")
    axis(1, pos=0) 
    axis(2, pos=0)
    
    vec.breaks <- seq(from = pi/2, to = 4*pi, by = pi/2)
    pi.halfs <- c(paste(expression(pi), "/2"),
                  paste(seq(from = 3, to = 21, by = 2), "*" , expression(pi), "/2"))
    pi.fulls <- c(paste(expression(pi)),
                  paste(seq(from = 2, to = 12, by = 1), "*" , expression(pi)))
    vec.expr <- parse(text = c(rbind(pi.halfs, pi.fulls)))[1:8]
    
    ggplot(data.frame(t=c(0,4*pi)), aes(t)) +
      stat_function(fun=function(t)A*sin(B*t+C)+D,geom="line",colour="red")  +
      ylab("A Sin(Bt+C)+D")+ xlab("t")+
      geom_hline(yintercept=0, colour="black", size = 1) +
      geom_vline(xintercept=0, colour="black", size = 1) +
      coord_cartesian(xlim=c(0, 4*pi)) + 
      scale_x_continuous(breaks=vec.breaks, labels=vec.expr)+
      theme(axis.text=element_text(size=16),axis.title=element_text(size=18,face="bold"))
  })
  
})