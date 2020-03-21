# Install packages

install.packages("rvest")
install.packages("dplyr")

# Use libraries

library(rvest)
library(dplyr)

# HTTP GET web page

web_page <- read_html("https://www.doctoroncall.com.my/coronavirus")

# Iterate over case statuses

confirmed_cases <- web_page %>% html_node(".stats-number-pink") %>% html_text()
discharged_cases <- web_page %>% html_node(".stats-number-green") %>% html_text()
death_cases <- web_page %>% html_node(".stats-number-grey") %>% html_text()
 
# Tabulate result
  
data <- c("Confirmed Cases", confirmed_cases, "Discharged Cases", discharged_cases, "Death Cases", death_cases)
coronavirus_data_frame <- matrix(data, ncol = 2, byrow = TRUE) %>%  as_tibble()
coronavirus_data_frame



