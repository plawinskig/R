# a.
# i. Zasymulować 600 rzutów kostką (odpowiednio przekształcić realizacje z rozkładu jednostajnego na [0,1]).

u <- runif(600)
tosses <- ceiling(6 * u)

u
tosses

# ii. Wyznaczyć średni wynik oraz wariancję z próby [porównać z wartością oczekiwaną 3,5 oraz wariancją 35/12].

mean <- mean(tosses)
variance <- var(tosses)

mean
variance

# iii. Wyznaczyć rozkład częstości dla tych wyników, polecenie - table [porównać z dyskretnym rozkładem jednostajnym].

frequency_table <- table(tosses)
frequency_table

# iv. Przekształcić tablicę w ramkę danych za pomocą polecenia „as.data.frame”.
# Wyświetlić tę ramkę oraz wyznaczyć wariancję tych częstości.

data_frame <- as.data.frame(frequency_table)
frequency_variance <- var(data_frame$Freq)

data_frame
frequency_variance

# b. Zasymulować 600 rzutów kostką za pomocą procedury wyboru elementu ze zbioru z zwracaniem (polecenie „sample”). 

range <- 1:6
n <- 600
tosses_sample <- sample(range, n, replace = TRUE)
tosses_sample

mean_sample <- mean(tosses_sample)
variance_sample <- var(tosses_sample)

mean_sample
variance_sample

table_sample <- table(tosses_sample)
table_sample

data_frame_sample <- as.data.frame(table_sample)
frequency_variance <- var(data_frame_sample$Freq)
frequency_variance


