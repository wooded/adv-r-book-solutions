### Write an equivalent to get() using as.name() and eval().
### (Don’t worry about the multiple ways of choosing an environment; assume that
### the user supplies it explicitly.)

get2 <- function(x, env) {
  eval(as.name(x), envir = env)
}

x <- 10
get("x", env = .GlobalEnv)
# [1] 10
get2("x", env = .GlobalEnv)
# [1] 10

### Write an equivalent to assign() using as.name(), substitute(), and eval().
assign2 <- function(x, value, env) {
  eval(substitute(x <- value,list(x = as.name(x), value = value)), env)
  if (length(x) > 1)
    warning('only the first element is used as variable name')
}
## somewhat convoluted?
e <- new.env()
assign2('x', 3, e)
e$x
# [1] 3
