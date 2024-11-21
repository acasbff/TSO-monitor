# test_sheets.R
library(googlesheets4)

# Authentication
options(gargle_quiet = TRUE)
gs4_deauth()
gs4_auth(path = "gs-creds.json")

# Your sheet URL
sheet_url <- "https://docs.google.com/spreadsheets/d/1wUMj9zsxa-eFd8F_XLyCbE7ZMsENwgH1cNq_0tXUHO0/edit?gid=0#gid=0"

# Try to read just the first cell to minimize data transfer
tryCatch({
  test_read <- read_sheet(sheet_url, range = "A1:A1")
  print("Successfully read from Google Sheets!")
  print("First cell content:")
  print(test_read)
}, error = function(e) {
  print("Error reading from Google Sheets:")
  print(e$message)
  quit(status = 1)
})