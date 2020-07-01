## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = ""
)

## ----echo=FALSE,include=FALSE,eval=TRUE---------------------------------------
options(crayon.enabled = TRUE)
options(crayon.colors = 256)
knitr::knit_hooks$set(output = function(x, options){
  paste0(
    '<pre class="r-output"><code>',
    fansi::sgr_to_html(x = htmltools::htmlEscape(x), warn = FALSE),
    '</code></pre>'
  )
})

## this is an ugly, ugly hack, but otherwise crayon does not listen
num_colors <- function(forget=TRUE) 256
library(crayon)
assignInNamespace("num_colors", num_colors, pos="package:crayon")

## ----setup,echo=FALSE,results="hide",include=FALSE----------------------------
library(colorDF)
library(tidyverse)
library(data.table)

## -----------------------------------------------------------------------------
data(starwars)
sw <- starwars[, c(1:3, 7:8)]
sw %>% colorDF
colorDF(sw) %>% summary

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
#  starwars %>% summary_colorDF

## ---- eval=TRUE---------------------------------------------------------------
foo <- starwars %>% select(name, species, homeworld) %>% 
  highlight(.$homeworld == "Tatooine")

## ----eval=FALSE---------------------------------------------------------------
#  ## for regular data frames
#  print.data.frame <- colorDF:::print.colorDF
#  
#  ## for tidyverse tibbles
#  print.tbl        <- colorDF:::print.colorDF
#  
#  ## for data.tables
#  print.data.table <- colorDF:::print.colorDF

## ----eval=FALSE---------------------------------------------------------------
#  rm(print.data.frame, print.tbl, print.data.table)

## ----problemchild, eval=TRUE,results="markdown"-------------------------------
options(colorDF_tibble_style="yes please")
options(colorDF_sep= " ")
options(colorDF_n=5)
colorDF(starwars)

