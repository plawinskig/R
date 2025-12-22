# Za pomocą symulowania odpowiedniego procesu, np. ciąg „rzutów monetą”
# i) Wygenerować 100 realizacji z rozkładu Bin(10; 0,3)

num_of_impl <- 100
n <- 10
p <- 0.3

results_bin <- numeric(num_of_impl)

for(i in 1:num_of_impl)
{
  u <- runif(n)
  num_of_success <- sum(u < p)
  results_bin[i] <- num_of_success
}

results_bin
mean(results_bin) # n * p = 10 * 0.3 = 3
barplot(table(results_bin),
        main = "Bin(10, 0.3)",
        xlab = "success count",
        ylab = "frequency"
        )

# ii) Wygenerować 50 realizacji z rozkładu Geom(0,4) 
# [Niech 𝑋 będzie liczbą prób do pierwszego sukcesu 
# gdy p’stwo sukcesu w dowolnej próbie wynosi p, wtedy 𝑋~𝐺𝑒𝑜𝑚(𝑝)].

num_of_impl <- 50
p <- 0.4

results_geom <- numeric(num_of_impl)

for(i in 1:num_of_impl)
{
  tries <- 1
  success <- FALSE
  
  while(!success)
  {
    u_curr <- runif(1) #one toss
    
    if(u_curr < p)
    {
      success <- TRUE
    }
    else
    {
      tries <- tries + 1
    }
  }
  
  results_geom[i] <- tries
}

results_geom
mean(results_geom) # 1/p = 1/0.4 = 2.5
barplot(table(results_geom),
        main="geom(0.4)",
        xlab="liczba prób",
        ylab="częstość" 
        )



