## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "",
  R.options=list(width=100)
)

## ----echo=FALSE,include=FALSE,eval=TRUE-----------------------------------------------------------
options(crayon.enabled = TRUE)
options(crayon.colors = 256)
knitr::knit_hooks$set(output = function(x, options){
  paste0(
    '<pre class="r-output"><code>',
    fansi::sgr_to_html(x = htmltools::htmlEscape(x), warn = FALSE),
    '</code></pre>'
  )
})

## ----setup,echo=FALSE,results="hide",include=FALSE------------------------------------------------
library(colorDF)
library(dplyr)
library(data.table)

## -------------------------------------------------------------------------------------------------
library(dplyr)
data(starwars)
sw <- starwars[, c(1:3, 7:8)]
sw %>% colorDF
colorDF(sw) %>% summary

## ----results="hide"-------------------------------------------------------------------------------
## works with standard data.frames
colorDF(mtcars)

## works with tidyverse tibbles
mtcars %>% as_tibble %>% colorDF

## works with data.table
colorDF(data.table(mtcars))

## ----echo=FALSE-----------------------------------------------------------------------------------
colorDF(mtcars)

## -------------------------------------------------------------------------------------------------
sw <- sw %>% as.colorDF
col_type(sw, "name") <- "identifier"
col_type(sw, "gender") <- "factor"
sw$probability <- runif(nrow(sw), 0, 0.1)
col_type(sw, "probability") <- "pval"
sw

## -------------------------------------------------------------------------------------------------
sw <- colorDF(starwars)
col_type(sw, c("vehicles", "films", "starships")) <- "hidden"
sw

## -------------------------------------------------------------------------------------------------
colorDF(sw, theme="bw")

## -------------------------------------------------------------------------------------------------
colorDF_themes_show(force_bg=TRUE)

## -------------------------------------------------------------------------------------------------
mtcars.c <- colorDF(mtcars)
df_style(mtcars.c, "sep") <- "; "

## -------------------------------------------------------------------------------------------------
starwars %>% as.colorDF %>% summary

## ----eval=FALSE-----------------------------------------------------------------------------------
#  starwars %>% summary_colorDF

## ----summary_mtcars,eval=TRUE---------------------------------------------------------------------
mtcars_cyl <- split(mtcars$mpg, mtcars$cyl)
sapply(mtcars_cyl, length)

## ----summary_mtcars2,eval=TRUE--------------------------------------------------------------------
summary_colorDF(mtcars_cyl, numformat="g", width=90)

## ----summary_iris---------------------------------------------------------------------------------
term_boxplot(Sepal.Length ~ Species, data=iris, width=90)

## ---- eval=TRUE-----------------------------------------------------------------------------------
foo <- starwars %>% select(name, species, homeworld) %>% 
  highlight(.$homeworld == "Tatooine")

## ---- eval=TRUE-----------------------------------------------------------------------------------
starwars %>% df_search("blue")

## ----eval=FALSE-----------------------------------------------------------------------------------
#  ## for regular data frames
#  print.data.frame <- colorDF:::print_colorDF
#  
#  ## for tidyverse tibbles
#  print.tbl        <- colorDF:::print_colorDF
#  
#  ## for data.tables
#  print.data.table <- colorDF:::print_colorDF

## ----eval=FALSE-----------------------------------------------------------------------------------
#  rm(print.data.frame, print.tbl, print.data.table)

## ----eval=FALSE-----------------------------------------------------------------------------------
#  setMethod("show", "DataFrame", function(object) colorDF::print_colorDF(object))

## ----eval=FALSE-----------------------------------------------------------------------------------
#  loadNamespace("S4Vectors")
#  setMethod("show", "DataFrame", function(object) colorDF::print_colorDF(object))

## ----alloptions,eval=TRUE,results="markdown",R.options=list(width=100)----------------------------
colorDF_options()

## ----problemchild, eval=TRUE,results="markdown"---------------------------------------------------
options(colorDF_tibble_style=TRUE)
options(colorDF_sep= " ")
options(colorDF_n=5)
colorDF(starwars)

