# Dzień 4.12.2024

# paczka danych
library(tidyverse)

# wczytanie danych
dane <- data("iris")
dane <- iris

# zmiana nazwy kolumn na male

dane <- dplyr::rename_with(dane, .cols = dplyr::everything(), \(i) tolower(i))
dane1 <- dplyr::mutate(dane, iloraz= petal.length/petal.width)

#grupowanie danych

dane_g <- dplyr::group_by(dane, species)

#wydrukuj do konsoli
dane_g

# podsumowania
dane_s <- dplyr::summarise(dane_g, srednia=mean(sepal.length), srednia_2=mean(sepal.width))

# praca na kilku kolumnach na raz

# logarytm
dane_2 <- dplyr::mutate(dane, sepal.length=log(sepal.length))
# pierwiastek
dane_2 <- dplyr::mutate(dane, sepal.width=sqrt(sepal.width), petal.length=sqrt(petal.length))

# across
dane_03 <- dplyr::mutate(dane, dplyr::across(sepal.length:petal.width, \(i) log10(i)))

# across przez kolumny które mają w nazwie lenght
dane_04 <- dplyr::mutate(dane, dplyr::across(contains("length"), \(i) log10(i)))

# across jedna kolumna po nazwie, dwie kolumny po początku nazwy

dane_05 <- dplyr::mutate(dane, dplyr::across(c(sepal.length, dplyr::contains("width")), \(i) sqrt(i)))

# across i zwykłe mutate: kolumny zaczynajace się od petal = log2, dodaj kolumn z wynikiem dzielenia kolumn petal
dane_06 <- dplyr::mutate(dane, dplyr::across(dplyr::starts_with("petal"), \(i) log2(i)), iloraz=petal.length/petal.width)

# across w summarise

dane_07 <- dplyr::summarise(dane, dplyr::across(dplyr::everything(), \(i) mean(i)))

# across na wartościach numerycznych

dane_08 <- dplyr::summarise(dane, dplyr::across(dplyr::where(\(i) is.numeric(i)), \(i) mean(i)))

# across na wartościach numerycznych więcej niż jedna funkcja

dane_09 <- dplyr::summarise(dane, dplyr::across(dplyr::where(\(i) is.numeric(i)), list(srednia=\(i) mean(i), mediana= \(i) median(i))))

# potokowanie (piping)
dane_10 <- dplyr::mutate(dane, suma = sepal.length+sepal.width+petal.length+petal.width)

#zgrupuj dane po kolumnie species

dane_10 <- dplyr::group_by(dane_10, species)

# policz średnią wartość wszystkich kolumn liczbowych

dane_10 <- dplyr::summarise(dane_10, dplyr::across(dplyr::where(\(i) is.numeric(i)),\(i) mean(i)))

# potokowanie w działaniach

dane_11 <- dane |>
  dplyr::mutate(suma = sepal.length+sepal.width+petal.length+petal.width) |>
  dplyr::summarise(dplpyr::across(dplyr::where(\(i)is.numeric(i)), \(i) mean (i)))














