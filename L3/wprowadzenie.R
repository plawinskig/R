# litery d, p ,q

# d - jak "dokładnie" (dla dyskretnych) lub "density" (dla ciągłych)

# dla dyskretnych liczy P(X = k)
# np. p'stwo że sprzedamy DOKŁADNIE 5 aut?
dpois(5, lambda = 3) # P(X = 5)

# dla ciągłych to NIE jest p'stwo
# to wysokość wykresu (gęstość)
# p'stwo że czas wynosi dokładnie 3.0000000000000 sekundy wynosi ZERO

# p - jak "pole" (lub "probability" - Dystrybuanta)
# liczy pole pod wykresem od lewej strony do punktu x
# P(X <= x) = P(X < x) dla ciągłych
# 'co najwyżej', 'mniej niż'

# q - jak "kwantyl" (odwrotność p)
# masz p'stwo i pytasz "poniżej jakieś wartości wpada 90% wyników?"
# wyznacz x, dla którego P(X < x) = 0.6

# -------

# dyskretne

# np. liczba sukcesów (binom) albo liczba telefonów/aut (pois)

# P(X >= k) = 1 - P(X <= k - 1)
1 - ppois(3, lambda = 3) # P(X >= 4) dla Poissona

# P(a <= X <= b) = P(X <= b) - P(X <= a - 1) # dla dyskretnych -1
lambda <- 3
ppois(5, lambda) - ppois(2, lambda) # P(3 <= X <= 5)

# ciągłe

# np. czas, waga, wzrost

# P(X > k) = 1 - P(X <= k)

# --------

# Rozkłady

# Świat dyskretny


# Rozkład dwumianowy (binom)

# k sukcesów w n próbach przy p'stwie p
# "n prób", "p'stwo sukcesu", "sukces/porażka"
# parametry:
#   n (size) - ile prób
#   p (prob) - p'stwo sukcesu
# na KONKRETNY LIMIT PRÓB w DYSKRETNYM


# Rozkład Poissona (pois)

# rozkład rzadkich zdarzeń w czasie lub przestrzeni, bez liczby prób
# "średnia liczba zdarzeń", "w ciągu godziny/tygodnia", "intensywność"
# parametr:
#   lambda - średnia liczba zdarzeń w danym czasie
# gdy NIE MA GÓRNEGO LIMITU w DYSKRETNYM


# Świat ciągły


# Rozkład jednostajny (unif)

# każdy wynik w przedziale tak samo prawdopodobny
# autobus kursuje do 15 minut, możesz przyjść w dowolnym momencie, czas oczekiwania [0,15]
# "rozkład jednostajny", "odcinek [a,b]", "losowo wybrany punkt"
# parametry:
#   a (min) - początek przedziału
#   b (max) - koniec przedziału
# wygląd: prostokąt


# Rozkład wykładniczy (exp)

# bliźniak Poissona, ae mierzy czas (ciągły)
# pois - ile aut przejechało
# exp - ile czasu minęło mięszy jednym autem a drugim
# bez pamięci. Żarówka nie "wie", że swieci już 100 godzin.
# p'stwo że zaraz padni jest ciągle takie same.
# "czas życia", "czas oczekiwania", "czas między zdarzeniami"
# parametr:
#   lambda (rate) - intensywność, to samo co w Poissonie
# wygląd: zjeżdżalnia








