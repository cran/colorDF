## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = ""
)

## ----setup,echo=FALSE,results="hide",include=FALSE----------------------------
library(colorDF)
library(tidyverse)
library(data.table)

## ----echo=FALSE,include=FALSE-------------------------------------------------
options(crayon.enabled = TRUE)
knitr::knit_hooks$set(output = function(x, options){
  paste0(
    '<pre class="r-output"><code>',
    fansi::sgr_to_html(x = x, warn = FALSE),
    '</code></pre>'
  )
})

## -----------------------------------------------------------------------------
data(starwars)
sw <- starwars[, c(1:4, 7:8)]
sw %>% colorDF
as.colorDF(sw) %>% summary

## ----results="hide"-----------------------------------------------------------
## works with standard data.frames
colorDF(mtcars)

## works with tidyverse tibbles
mtcars %>% as_tibble %>% colorDF

## works with data.table
colorDF(data.table(mtcars))

## ----echo=FALSE---------------------------------------------------------------
colorDF(mtcars)

## -----------------------------------------------------------------------------
sw <- sw %>% as.colorDF
col_type(sw, "name") <- "identifier"
col_type(sw, "gender") <- "factor"
sw$probability <- runif(nrow(sw), 0, 0.1)
col_type(sw, "probability") <- "pval"
sw

## -----------------------------------------------------------------------------
colorDF(sw, theme="bw")

## -----------------------------------------------------------------------------
colorDF_themes_show()

## -----------------------------------------------------------------------------
mtcars.c <- colorDF(mtcars)
df_style(mtcars.c, "sep") <- "; "

## -----------------------------------------------------------------------------
starwars %>% as.colorDF %>% summary

## ----eval=FALSE---------------------------------------------------------------
#  starwars %>% summaryColorDF

## ---- eval=FALSE--------------------------------------------------------------
#  foo <- starwars %>% select(name, species, homeworld) %>%
#    highlight(.$homeworld == "Tatooine")

