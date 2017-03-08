# Load the required libraries
library(shiny)
library(shinythemes)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    # pick a theme (more details at https://rstudio.github.io/shinythemes/)
    theme = shinytheme("sandstone"),

    # Application title
    titlePanel("Predicting Mid-Atlantic Wage Data"),
    h5("Note: For best results, please view in full screen mode"),

    # Sidebar with:
    # Multi select input dropdown (upto three inputs)
    # Radio buttons to choose smoothing method
    # Checkbox to show/hide the confidence interval
    sidebarLayout(
        sidebarPanel(
            HTML(
                "The Mid-Atlantic wage dataset contains wage and other data for a group of 3000 workers in the Mid-Atlantic region. The dataset has 3000 observations on 12 variables. We have picked 9 of these variables for this app. By default, we plot Age vs. Wage; what you need to do is pick upto 3 additional variables, and the app will redraw the plot as a facet grid.<br/><br/>The app also fits a regression model (linear is the default), which can be changed to one of the other choices displayed in the radio buttons under \"Select Smoothing Method\". You can also choose to display the confidence interval for the fitted line.<br/><br/>"
            ),
            uiOutput("chooseVars"),
            radioButtons("methRadio", "Select Smoothing Method",
                         as.list(c(
                             "lm", "glm", "gam", "loess"
                         ))),
            checkboxInput("showConfInt", "Show/Hide Confidence Interval"),
            width = 3
        ),

        # Show a plot of the generated distribution
        # When one variable is chosen, it displays by colour
        # When more than one variables are chosen, it displays in a facet grid
        mainPanel(plotlyOutput("wagePlot", height = "900px"))
    )
))
