
shinyUI(pageWithSidebar(
  
  
  headerPanel(h2('Compute the remaining amount of the selected radioactive isotope after decaying for the selected duration',align='center'),
              windowTitle = 'Radioactive Decay Calculator'),
  
  sidebarPanel(
    
    helpText('This application used the user inputs to calculate the remaining amoun of the seleted radioactive isotope after decaying for a time period of length t. It also computes the percentage of remaining amounts of all the listed radioactive isotopes after the specified time period. '),
    
    
    numericInput('initial_amount',h4('Initial amount (in grams)'), 1000),
    
    radioButtons('isotope',
                 label=h4('Radioactive Isotope (choose one)'),
                 choices = c('beryllium-11','carbon-10','dubnium-261','seaborgium-266', 'dubnium-262'),
                 selected='beryllium-11'),
    
    sliderInput('etime',h4('Duration of Radioative Activity (seconds)'),value=30,min=0,max=180,step=5),
    
    HTML('<a href="https://github.com/mghaz007/Developing-Data-Products" class="bar"><strong>For more information click here for source code and readme.</strong></a>')
    
  ),
  
  mainPanel(
    
    h5('The initial amount (grams):'),
    verbatimTextOutput('myInitialAmount'),
    
    #h5('Converted pounds (lbs) to kilograms (kg) of:'),
    #verbatimTextOutput('mykg'),
    
    h5('Chosen radioactive isotope:'),
    verbatimTextOutput('myIsotope'),    
    
    # h5('Established METs:'),
    # verbatimTextOutput('mymets'),        
    
    h5('Desired Radioative Decay Duration(seconds):'),    
    verbatimTextOutput('myTime'),    
    
    h5('Estimated amount of remaining radioactive isotope (in grams):'),
    verbatimTextOutput('myRemainPercent'),
    
    h5('The percentage of remaining amount of each radioactive isotope after the user specified duration:'),
    plotOutput('myplot')
  )
))