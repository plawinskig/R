# Za pomocą symulowania odpowiedniego procesu, np. ciąg „rzutów monetą”
# set.seed(55)

# i) Wygenerować 100 realizacji z rozkładu Bin(10; 0,3)
n <- 100
size <- 10
prob <- 0.3
res <- numeric(n)

for(i in 1:n)
{ 
  u <- runif(size)
  num_of_succ <- sum (u < prob)
  res[i] <- num_of_succ
}
res
mean(res) # size * prob = 3
barplot(table(res), 
        main="X ~ Bin(10, 0.3)", 
        xlab = "success count",
        ylab = "frequency"
        )
hist(res,
     main="X ~ Bin(10, 0.3)", 
     xlab = "success count",
     ylab = "frequency"
     )

# ii) Wygenerować 50 realizacji z rozkładu Geom(0,4) 
# [Niech 𝑋 będzie liczbą prób do pierwszego sukcesu 
# gdy p’stwo sukcesu w dowolnej próbie wynosi p, wtedy 𝑋~𝐺𝑒𝑜𝑚(𝑝)].

n <- 50
prob <- 0.4
res <- numeric(n)

for(i in 1:n)
{
  tries <- 1
  success <- FALSE
  
  while(!success)
  {
    u <- runif(1)
    
    if(u < prob)
    {
      success <- TRUE
    }
    else
    {
      tries <- tries + 1
    }
  }
  
  res[i] <- tries
}

res
mean(res) # 1/p = 2.5
hist(res,
     main="X ~ Geom(0.4)", 
     xlab = "tries",
     ylab = "frequency"
     )
barplot(table(res), 
        main="X ~ Geom(0.4)", 
        xlab = "tries",
        ylab = "frequency"
        )





