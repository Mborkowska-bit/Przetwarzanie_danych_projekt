library(tidyverse)
library(readxl)

# wczytanie danych

dane <- readxl::read_excel("R/src/zmienne-excel-poprawione.xlsx", sheet ="Arkusz1")

# zmiana nazwy kolumn
dane <- dplyr::rename(dane, godziny_snu =`godziny snu`)

dane <- dplyr::rename(dane, ilosc_obejrzanych_odcinkow_serialu=`ilość obejrzanych odcinków serialu`)
dane <- dplyr::rename(dane, ilosc_przeczytanych_stron_ksiazki=`ilosc przeczytanych stron ksiazki`)

# zmiana nazwa z wielkiej na mala

dane2 <- dplyr::rename_with(dane, .cols = everything(), \(i) tolower(i))

# zmiana z małej litery na wielka
dane3 <- dplyr::rename_with(dane, .cols = everything(), \(i) toupper(i))

dane4 <- dplyr::rename_with(dane, .cols =dplyr::starts_with("data"), \(i) toupper(i))

# zmiana wybranej kolumny na wielkie litery

dane5 <- dplyr::rename_with(dane, .cols =dplyr::contains("kawy"), \(i) toupper(i))

dane6 <- dplyr::rename_with(dane, .cols =dplyr::contains("stron"), \(i) toupper(i))

# operacje na kolumnach

dane2$kolumna6 <- dane2[,2]/dane2[,3]

# operacje na kolumnach mutate

dane4 <- dplyr::mutate(dane, wynik_dzielenia = godziny_snu/Ilosc_wypitych_kubkow_kawy, wynik_dodawania_4 = ilosc_obejrzanych_odcinkow_serialu +1, wynik_dodawania_4_5 = ilosc_obejrzanych_odcinkow_serialu + ilosc_przeczytanych_stron_ksiazki)

Dane7 <- dplyr::mutate(dane, godziny_snu = godziny_snu/1.5)

Dane8 <- dplyr::mutate(dane, godziny_snu = godziny_snu/1.5, .keep = "none")


# przesuwanie danych
dane9 <- dplyr::relocate(Dane7, godziny_snu, .after = 4)

