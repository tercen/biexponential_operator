library(tercen)
library(dplyr, warn.conflicts = FALSE)
library(flowCore)


do.transform = function(df, ...) {
  biexp  <- biexponentialTransform("bi_exponential")
  scale.m = try(transform(new("flowFrame", exprs = as.matrix(df)), `.y` =
                            biexp(`.y`))@exprs[, 3],
                silent = TRUE)
  
  if (inherits(scale.m, 'try-error')) {
    return (data.frame(
      .ri = integer(),
      .ci = integer(),
      scale = double()
    ))
  }
  
  result = as_tibble(scale.m) %>%
    rename_all(
      .funs = function(x)
        'transform'
    ) %>%
    mutate(.ri = df$.ri, .ci = df$.ci)
  
  return (result)
}


ctx = tercenCtx()

ctx = ctx %>%
  select(.ci, .ri, .y) %>%
  group_by(.ci, .ri) %>%
  summarise(.y = mean(.y)) %>%
  group_by(.ri) %>%
  do(do.transform(.)) %>%
  ctx$addNamespace() %>%
  ctx$save()