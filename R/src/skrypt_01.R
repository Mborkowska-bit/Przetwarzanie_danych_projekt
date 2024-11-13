# ładowanie paczek
library(tidyverse)

# Dane: nowa zelandia (z www)
dane_www <- readr::read_csv(file = "https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv")

#Wczytanie z dysku z pełna ścieżka - sciezka bezwzgledna
dane_dysk <- readr::read_csv(file = "C:/Github/Przetwarzanie_danych_projekt/R/data_new_zeland/annual-enterprise-survey-2023-financial-year-provisional.csv")

# wczytanie z dysku - sciezka wzgledna

dane_dysk_02 <- readr::read_csv(file = "R/data_new_zeland/annual-enterprise-survey-2023-financial-year-provisional.csv")

# zamiana danej tekstowej na liczbowa
dane_dysk_02$Value <- as.numeric(dane_dysk_02$Value)

# parsowanie tekstu na numer
dane <- readr::read_csv(file = "R/data_new_zeland/annual-enterprise-survey-2023-financial-year-provisional.csv")
dane$Value <- readr::parse_number(dane$Value)

dane[748,"Value"]
