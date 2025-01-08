# paczki
library(tidyverse)

# test potokowania

dane_nadpisane <- c(6,7,8,9)
dane_nadpisane <- cumsum(dane_nadpisane)
dane_nadpisane <- mean(dane_nadpisane)

# zapis z zagnieżdzoną funkcją
dane_funkcja <- mean(cumsum(c(6, 7, 8, 9)))

#zapis z użyciem potokowania ("pipe")
dane_potok <- c(6, 7, 8, 9) |>
cumsum() |>
  # komentarz 2
mean()

# tidyr ####

data <- iris

# zmiana formatu long na wide
l_2_w <- data |>

tidyr::pivot_wider(names_from = Species, values_from = Sepal.Length:Petal.Length)

# paczka pingwiny
pingwiny <- palmerpenguins::penguins

pingwiny_wide <- pingwiny |>
  tidyr::drop_na() |>
  # zmiana formatu na szerszy
  tidyr::pivot_wider(names_from = sex, values_from = -sex)

# zmiana formatu wide na long
pingwiny_longer <- pingwiny |>
tidyr::pivot_longer(bill_length_mm:body_mass_g,names_to = "zmienna", values_to = "wartości" )

# wykres
ggplot2::ggplot(pingwiny_longer, aes(year, wartości, color= species)) + geom_point() + facet_wrap(vars(zmienna))


# pingwiny format do szerokiego
pingwiny_wider <- pingwiny_longer |>
tidyr::pivot_wider(names_from = zmienna, values_from = wartości)

pingwiny <- pingwiny |>
  dplyr::mutate(id= 1:length(year))

pingwiny_wider <- pingwiny_longer |>
  tidyr::pivot_wider(names_from = zmienna, values_from = wartości)

# joins (operacje na wielu ramkach) ####

# pingwiny podział na płeć
pingwiny_samce <- pingwiny |>
  dplyr::filter(sex == "male")

# wybór samic 1 sposób
pingwiny_samice <- pingwiny |>
  dplyr::filter(sex == "female")

# wybór samic 2 sposób
  #pingwiny_samice <- pingwiny |>
  #dplyr::filter(!sex == "male")

# połączenie ramek - bind rows

pingwiny_m_s <- dplyr::bind_rows(pingwiny_samce, pingwiny_samice)

# podział kolumn
pingwiny_1 <- pingwiny |>
  dplyr::select(species:body_mass_g)

pingwiny_2 <- pingwiny |>
  dplyr::select(-c(species:body_mass_g))
# łaczenie kolumn - bind cols

pingwiny_1_2 <- dplyr::bind_cols(pingwiny_1, pingwiny_2)










