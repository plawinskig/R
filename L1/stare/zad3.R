## i)

(a <- seq(300L, 0L, -3L))
(b <- c("one", "two", "three", "four", 5))
(c <- c("one", "two", "three", "four", "5"))
(d <- rep(c(3L, 1L, 6L), times=4))
(e <- rep(c(3L, 1L, 6L), each=4))
(f <- c(5L, 1L, 4L, 7L))

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
sort(b)
sort(e)


### iv)
d+f
sum(d*f)
a[35]
a[67:85]

## v)
a[a < 100]
length(a[a < 100])

