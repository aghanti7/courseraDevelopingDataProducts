# Load the required libraries
library(shiny)
library(plotly)
library(ggplot2)
library(ISLR)

# Load Mid-Atlantic wage data
data(Wage)

# Define server logic
shinyServer(function(input, output) {
    # Preprocess wage data, pick only a subset of the fields
    wageData <-
        Wage[, c(
            "wage",
            "year",
            "age",
            "maritl",
            "race",
            "education",
            "jobclass",
            "health",
            "health_ins"
        )]
    # Rename column names to be more meaningful
    names(wageData) <-
        c(
            "Wage",
            "Year",
            "Age",
            "MaritalStatus",
            "Race",
            "Education",
            "JobClass",
            "Health",
            "HealthInsurance"
        )

    # X & Y axes are fixed
    x <- "Age"
    y <- "Wage"

    # Upto 3 more variables can be picked from this list
    z <-
        c(
            "Education",
            "Race",
            "MaritalStatus",
            "JobClass",
            "Health",
            "HealthInsurance",
            "Year"
        )

    # Multi select picker in the UI that depends on the list of additional
    # input variables (supports picking upto 3 additional input variables)
    output$chooseVars <- renderUI({
        selectizeInput(
            "varsInput",
            "Select Upto Three Additional Input Variables",
            as.list(z),
            multiple = TRUE,
            options = list(maxItems = 3)
        )
    })

    # Determine how many input variables have been selected
    numberOfSelectedVars <- reactive ({
        if (is.null(input$varsInput))
            0
        else
            length(input$varsInput)
    })

    # Render the plot (or grid of plots)
    output$wagePlot <- renderPlotly({
        numVars = numberOfSelectedVars()

        p <- {
            # 0 variables picked: show Age vs. Wage only
            if (numVars == 0)
                ggplot(wageData, aes_string(x, y)) + geom_point(colour = "dark green")
            # 1 or more variables picked: show Age vs. Wage and the other variable in colour
            else
                ggplot(wageData,
                       aes_string(x, y, colour = input$varsInput[1])) + geom_point()
        } + {
            # 2 variables picked: show a facet grid in columns
            if (numVars == 2)
                facet_grid(reformulate(input$varsInput[2]))
            # 3 variables picked: show a facet grid in rows x columns
            else if (numVars == 3)
                facet_grid(reformulate(input$varsInput[3], input$varsInput[2]))
        } +
            # Fit according to the smoothing method picked, and
            # whether the confidence interval should be shown
            geom_smooth(
                size = .3,
                method = input$methRadio,
                se = input$showConfInt
            )

        ggplotly(p)
    })

})
