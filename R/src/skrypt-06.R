# 15.01.2024

library(tidyverse)

# wczytanie danych

data_1 <- readxl::read_excel("R/src/data_msu.xlsx", sheet = "loi")
data_2 <- readxl::read_excel("R/src/data_msu.xlsx", sheet = "elemental")
data_3 <- readxl::read_excel("R/src/data_msu.xlsx", sheet = "bsi")

# wylistowanie dostępnych arkuszy
readxl::excel_sheets("R/src/data_msu.xlsx")

# łączenie ramek (mutating join)
# left join

dane_left1 <- dplyr::left_join(x = data_1, y = data_2)
dane_left2 <- dplyr::left_join(x = data_1, y = data_3)

dane_left3 <- dplyr::left_join(x = data_1, y = data_3, by = dplyr::join_by(sample.id==sample.id))

dane_left4 <- dplyr::left_join(dplyr::select(data_1, -mass.mg), dplyr::rename(data_3, nazwa.id=sample.id),
                               by = dplyr::join_by(sample.id==nazwa.id))

dane_left5 <- dplyr::left_join(data_1, data_2, by = dplyr::join_by(sample.id)) |>
  dplyr::left_join(x=_, y= data_3, by=dplyr::join_by(sample.id))

# right join

dane_right1 <- dplyr::right_join(x = data_1, y = data_2)
dane_right2 <- dplyr::right_join(x = data_1, y = data_2, by = dplyr::join_by(sample.id==sample.id))

dane_right3 <- dplyr::right_join(data_3,data_1, by = dplyr::join_by(sample.id)) |>
  dplyr::right_join(data_2, by = dplyr::join_by(sample.id))

# łączenie wszystkiego (inner_join)

data_inner1 <- dplyr::inner_join(data_1, data_2)

# szalone nutki

data_szalone <- dplyr::inner_join(data_1, data_3, by= dplyr::join_by(sample.id)) |>
  dplyr::right_join(dane_right1)

# łączenie wszystkiego (full join)
data_full1 <- dplyr::full_join(data_1, data_2)

# semi join
data_semi1 <- dplyr::semi_join(data_1, data_2)

# anti join
data_anti1 <- dplyr::anti_join(data_3, data_1)























