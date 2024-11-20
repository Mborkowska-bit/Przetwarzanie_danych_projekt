# load packages
library(tidyverse)
data <- iris

# statystyki płatka

sredni_platek <- mean(data$Petal.Length)

mediana_platek <- median(data[,1])

odchylenie_standardowe <- sd(data$Petal.Length)

# średnie dla gatunków

sredni_setosa <- mean(data[1:50,4])

sredni_versi <- mean(data[51:100,4])

sredni_virgi <- mean(data[101:150,4])

# średnia dla gatunku po nazwie

sredni_platek_setosa <- mean(data[data$Species=="setosa",4])

# podsumowanie

podsumowanie <- summary(data)
podsumowanie

# podsumowanie dla dwóch kolumn

podsumowanie_kolumny <- summary(data[,1:2])
podsumowanie_kolumny

# suma długości

data$Suma_dlugosci <- data$Sepal.Length+data$Petal.Length

# Frakcja

data$frakcja <- (data$Sepal.Length+data$Petal.Length)/data$Sepal.Width

# Średnia jako kolumna

data$srednia <- mean(c(data$Sepal.Length, data$Petal.Length))

# ramka danych tylko dla setosa

data_setosa <- data[data$Species=="setosa",]
data_setosa

# ramka dla setosa i versicolor

data_setosa_versicolor <- data[data$Species==c("setosa", "versicolor"),]

# ramka danych tylko oryginalne kolumny

data_oryginalne <- dplyr::select(data, Sepal.Length:Species)
#wybór zmiennych według nazwy od:do

data_oryginalne_tylko_sepal <- dplyr::select(data,Sepal.Length:Sepal.Width)

# wybór zmiennych według nazwy z zapisem sklejanym

data_oryginalne_tylko_sepal2 <- dplyr::select(data,Sepal.Length,Sepal.Width)

# wybór zmiennych według nazwy z zapisem według początku

data_oryginalne_tylko_sepal3 <- dplyr::select(data,starts_with("Sepal"))
data_oryginalne_tylko_petal <- dplyr::select(data,starts_with("Petal"))

# wybór zmiennych według nazwy z zapisem według konca
data_oryginalne_tylko_length <- dplyr::select(data,ends_with("Length"))

# wybór zmiennych według nazwy z zapisem wspólnych znaków
data_oryginalne_tylko_al <- dplyr::select(data,contains("al"))

# wybór zmiennych według nazwy z zapisem według początku - zanegowane
data_zanegowane <- dplyr::select(data, !starts_with("petal"))

#wybór wierszy setosa

data_wiersze_1 <- dplyr::filter(data, Species=="setosa")

#wybór wierszy nie setosa

data_wiersze_2 <- dplyr::filter(data, !Species=="setosa")

# wybor wierszy - płatki dłuższe niz 5

data_dluzsze_niz_5 <- dplyr::filter(data, Petal.Length>5.0)


# wybor wierszy - płatki dłuższe niz 5 oraz mniejsze niz 6

data_wiersze_3 <- dplyr::filter(data, Petal.Length>5.0 & Petal.Length< 6.0)

data_wiersze_4 <- dplyr::filter(data, Petal.Length>5.0 & Petal.Length< 5.5)

data_wiersze_5 <- dplyr::filter(data, Petal.Length>5.0 & Petal.Length<6.0 & Petal.Width> 2.0)















