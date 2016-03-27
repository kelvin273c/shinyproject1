#server.R
function(input, output) {
  
  heightSize <- reactive(input$plot1_Height)
  widthSize <- reactive(input$plot1_Width)
  
  regFormula <- reactive ({
    if(input$atype == '0') {
    as.formula(paste('mpg', '~', input$Regressor))
    }
    else {
      
      xnam <- paste0(input$mregressor)
      (fmla <- as.formula(paste('mpg', '~', paste(xnam, collapse= "+"))))
    }
  })
  
  regmodel <- reactive({
    
      lm(regFormula(), data = mtcars)
  })
  
  output$plot1 <- renderPlot({
    if (input$atype == "1"){
    pairs(~mpg+wt+disp+qsec+hp+drat+cyl+am+carb+vs+gear,data=mtcars,upper.panel=panel.smooth,lower.panel=panel.cor,pch=20)
    }
    else {
      if (input$Regressor == "am"){
        boxplot(mtcars$mpg ~ mtcars$am, xlab = "Transmission",ylab = "Miles per Gallon",main="Fuel Efficiency vs. Transmission")
      }
      else if (input$Regressor == "wt") {
        plot(mtcars$wt, mtcars$mpg, xlab = "Weight",ylab = "Miles per Gallon",main="Fuel Efficiency vs. Weight")
      }
      else if (input$Regressor == "disp") {
        plot(mtcars$disp, mtcars$mpg,  xlab = "Displacement",ylab = "Miles per Gallon",main="Fuel Efficiency vs. Displacement")
      }
      else if (input$Regressor == "drat") {
        plot(mtcars$drat, mtcars$mpg, xlab = "Drive Ratio",ylab = "Miles per Gallon",main="Fuel Efficiency vs. Drive Ratio")
      }
      else if (input$Regressor == "qsec") {
        plot(mtcars$qsec, mtcars$mpg, xlab = "Quarter Sec.",ylab = "Miles per Gallon",main="Fuel Efficiency vs. Quarter Sec.")
      }
      else if (input$Regressor == "hp") {
        plot(mtcars$hp, mtcars$mpg, xlab = "Horsepower",ylab = "Miles per Gallon",main="Fuel Efficiency vs. Horsepower")
      }
      else if (input$Regressor == "carb"){
        boxplot(mtcars$mpg ~ mtcars$carb, xlab = "# of Carburettors",ylab = "Miles per Gallon",main="Fuel Efficiency vs. No. of Carburettors")
      }
      else if (input$Regressor == "gear"){
        boxplot(mtcars$mpg ~ mtcars$gear, xlab = "# of gears",ylab = "Miles per Gallon",main="Fuel Efficiency vs. No. of Gears")
      }
      else if (input$Regressor == "vs"){
        boxplot(mtcars$mpg ~ mtcars$vs, xlab = "Style of Engine",ylab = "Miles per Gallon",main="Fuel Efficiency vs. Eninge Style")
      }
      else if (input$Regressor == "cyl"){
        boxplot(mtcars$mpg ~ mtcars$cyl,xlab = "# of Cylinders",ylab = "Miles per Gallon",main="Fuel Efficiency vs. No. of Cylinders")
      }
    }
  }, height=heightSize, width=widthSize)
  
  output$model <- renderPrint({
    summary(regmodel())
  })
  }
