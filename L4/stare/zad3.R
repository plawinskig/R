# Wygenerować 1000 liczb z następnego rozkładu dyskretnego (należy zminimalizować oczekiwany czas działania).
# k       0    1    2   3
# P(X=k)  0,15 0,25 0,5 0,1

# uporządkowanie malejąco
# szybciej wyskakujemy z pętli

# 2 - [0, 0.5)
# 1 - [0.5, 0.75)
# 0 - [0.75, 0.9)
# 3 - [0.9, 1)

vals <- c(2, 1, 0, 3)
probs <- c(0.5, 0.25, 0.15, 0.1)

# s[1] = probs[1]
# s[n+1] = s[n] + probs[n+1]
cum <- cumsum(probs)

n <- 100
u <- runif(n)
results <- numeric(n)

for (i in 1:n)
{
  u_curr <- u[i]
  
  j <- 1
  while(u_curr > cum[j])
  {
    j <- j + 1
  }
  
  results[i] <- vals[j]
}

result_tab <- table(results)
result_tab
result_prop <- prop.table(result_tab)
result_prop

barplot(result_tab,
        main = "rozklad wylosowanych liczb",
        xlab = "k",
        ylab = "liczebnosc"
        )

