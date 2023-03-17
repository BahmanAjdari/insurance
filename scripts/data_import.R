# Read excel files and save it to ridy dataframes

# load libraries
#require(readxl)
library(readxl)
# read amalkard (productivity)

# sheet names in English
en_names_sheets <- c("fire","transport","incidents",
                     "incidents_driver","vehicle","third",
                     "health","ship","aeroplane",
                     "engineering","money","responsibility",
                     "credit","oil_energy","others",
                     "total_nonr_life","life","total"
                     )

# col names in English
en_names_cols <- c("total_paid", "total_gained",
              "none_gov_paind", "none_gov_gained",
              "private_paid","private_gained", 
              "saderat_paid", "saderat_gained", 
              "gov_paid", "gov_gained", 
              "dana_paid","dana_gained",
              "alborz_paid","alborz_gained",
              "asia_paid", "asia_gained",
              "iran_paid", "iran_gained",
              "year")

# dunction to read all sheets in the file
read_excel_allsheets <- function(filename, tibble = TRUE) {
  sheets <- readxl::excel_sheets(filename)
  x <- lapply(sheets, function(X) readxl::read_excel(filename, sheet = X, skip = 4))
  names(x) <- en_names_sheets
  x
}

# Reading the actual file
list_amalkard <- read_excel_allsheets("data/amalkardsanat.xlsx")
list_amalkard

total_df <- list_amalkard$total[1:46,1:19]

names(total_df)
