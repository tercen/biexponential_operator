library(tercen)
library(dplyr, warn.conflicts = FALSE)
library(data.table)
library(dtplyr)
library(flowCore)


ctx = tercenCtx()

df <-  ctx$select(list(".ci", ".ri", ".y")) 
ff<-new("flowFrame", exprs = data.matrix(df))

scale.m = try(transform(ff, `yt` =
                          biexponentialTransform("bi_exponential")(`.y`))@exprs,
              silent = FALSE)  %>%
  as_tibble()  %>%
  select(yt) %>%
  ctx$addNamespace() %>%
  ctx$save()

