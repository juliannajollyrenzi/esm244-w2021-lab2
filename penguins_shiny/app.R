# Attach packages
library(shiny)
library(tidyverse)
library(palmerpenguins)

# Create user interface (UI)
ui <- fluidPage(
    titlePanel("I am adding a TITLE!"), # title for the whole thing
    sidebarLayout( # sidebar layout with a widget and a graph section
        sidebarPanel("put my widgets here!", # title
                     radioButtons(inputId = "penguin_species", # need to give it an name to identify it in the server
                                  label = "Choose penguin species: ", # text users see
                                  choices = c("Adelie", "COOL CHINSTRAP PENGUINS" = "Chinstrap", "Gentoo")) # user choices: filter by these in the server also (match the way the variables look in the dataset)
                     ), # radioButtons is a widget from the Shiny Widgets Gallery
        mainPanel("Here's my graph!")
    )
) # fluid page layout




# Create the server function (takes input from the user and creates output)
server <- function(input, output) {

    penguin_select <- reactive({
        penguins %>%
            filter(speces == input$penguin_species) # populated by RadioButtons input selected by user
    }) # df that reacts to what user selects--interior squiggly and exterior parentheses

    output$penguin_plot <-  # now make an output (come out of the function). Both output/input use dollar sign

}


# Combine into app
shinyApp(ui = ui, server = server)
