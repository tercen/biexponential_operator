suppressPackageStartupMessages({
  library(tercen)
  library(dplyr, warn.conflicts = FALSE)
  library(data.table)
  library(dtplyr)
  library(flowCore)
})

ctx = tercenCtx()

df <- ctx$select(list(".ci", ".ri", ".y")) 
ff <- new("flowFrame", exprs = data.matrix(df))

par_a <- ctx$op.value("a", as.numeric, 0.5)
par_b <- ctx$op.value("b", as.numeric, 1)
par_c <- ctx$op.value("c", as.numeric, 0.5)
par_d <- ctx$op.value("d", as.numeric, 1)
par_f <- ctx$op.value("f", as.numeric, 0)
par_w <- ctx$op.value("w", as.numeric, 0)

scale.m = try(
  transform(
    ff, `value` =
    biexponentialTransform("bi_exponential", a = par_a, b = par_b, c = par_c, d = par_d, f = par_f, w = par_w)(`.y`)
  )@exprs, silent = FALSE)  %>%
  as_tibble()  %>%
  select(.ci, .ri, value) %>%
  mutate(.ci = as.integer(.ci), .ri = as.integer(.ri)) %>%
  ctx$addNamespace() %>%
  ctx$save()

