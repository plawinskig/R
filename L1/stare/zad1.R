## i)

(a <-  c(1L, 4L, 6L, 13L, -10L, 8L))
(b <- seq(1L, 101L, 2L))
(c <- rep(c(4L,7L,9L), each=3))
(d <- c("czy", "to", "jest", "wektor", NA))
(e <- c("czy", "to", "jest", "wektor", "NA"))
(f <- rep(c(4L,7L,9L), times=6))

## ii)
print_ii <- function(v){
  print(v)
  print(length(v))
  print(typeof(v))
  print(min(v))
  print(max(v))
  if (is.numeric(v)) {
    print(sum(v))
  }
}

print_ii(a)
print_ii(b)
print_ii(c)
print_ii(d)
print_ii(e)
print_ii(f)


## iii)
sort(d)
sort(e)


## iv)
a+f
a*f
a+c
a+10
15*a
b[26]
f[6:10]


### v)
b[b > 50]
length(b[b > 50])
