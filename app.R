library(shiny)

ui <- fluidPage(
  fluidRow(
    column(width = 12,
           tags$h1('R-ladies libs'))
  ),
  fluidRow(
    column(width = 4,
           textInput(inputId = 'adjective1', label = 'adjective'),
           textInput('verb1', 'verb ending in "ing"'),
           textInput('verb2', 'verb ending in "ing"'),
           textInput('noun', 'plural noun'),
           actionButton('submit', 'Submit')),
    column(width = 8,
           tags$h2('Statement of Purpose?'),
           textOutput('statement_of_purpose'))
  )
)

server <- shinyServer(function(input, output) {
  
  sentence <- eventReactive(input$submit, {
    paste0('R-ladies is a ', input$adjective1, ' organization dedicated to ', 
           input$verb1, ' R, and ', input$verb2, ' a network among ', 
           input$noun, '.')
  })
  
  output$statement_of_purpose <- renderText({
    sentence()
  })
})

shinyApp(ui, server)