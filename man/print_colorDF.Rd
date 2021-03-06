% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/print.R
\name{print.colorDF}
\alias{print.colorDF}
\alias{print_colorDF}
\title{Print method for colorful data frames}
\usage{
\method{print}{colorDF}(x, ...)

print_colorDF(
  x,
  n = getOption("colorDF_n"),
  width = getOption("width"),
  row.names = TRUE,
  tibble_style = getOption("colorDF_tibble_style"),
  highlight = NULL,
  sep = getOption("colorDF_sep"),
  bg = NULL,
  fg = NULL,
  ...
)
}
\arguments{
\item{x}{a colorful data frame (object with class colorDF), a
data.frame, a tibble, a data.table or any other object which can be coerced
to data frame with as.data.frame function.}

\item{...}{further arguments are ignored}

\item{n}{Number of rows to show (default=20, use Inf to show all; this
value can be set with options("colorDF_n"))}

\item{width}{number of characters that the data frame should span on output}

\item{row.names}{if TRUE (default), row names will be shown on output}

\item{tibble_style}{whether to print with tibble style (overrides style setting)}

\item{highlight}{a logical vector indicating which rows to highlight}

\item{sep}{column separator string (overrides style setting)}

\item{bg}{set default background for the table}

\item{fg}{set default foreground for the table}
}
\description{
This is the core of the colorDF package – a print method for the colorful (and other) data frames.
}
\details{
print_colorDF is the exported function, print.colorDF is the S3 method.
Otherwise they are identical.

\code{print_colorDF} is a function that can be applied to any data frame like
object. Using \code{\link[=colorDF]{colorDF()}} to change the class of the object is only
necessary if modifications to the style are required, such as specifying
column type. However, \code{print_colorDF} applied to virtually any data frame,
tibble or data table will work. In such a case, the theme used to display the data frame
will either be taken from \code{\link[base:options]{getOption("colorDF_theme")}} or a default theme will be used.
}
\section{Column types}{


Column types are basically the column classes (numeric, factor etc.) plus a few specialized
types (such as p-value) which are displayed slightly differently. For
example, an identifier will usually be shown in bold, and significant
p-values will be red (details depend on the given theme and style; see
\code{\link[=col_type]{col_type()}} and \code{\link[=df_style]{df_style()}} for more information).
}

\section{Changing the default methods}{

It is possible to assign \code{print_colorDF} to the default methods, thus
changing the way how tibbles, data frames or other data frame like objects
are displayed. This should be generally safe, but use it on your own peril
and preferably only in interactive sessions. I use the following code in my
\link[base:Startup]{.Rprofile} file:\preformatted{if(interactive()) \{
  print.data.frame <- colorDF::print_colorDF
  print.tbl        <- colorDF::print_colorDF
  print.data.table <- colorDF::print_colorDF
\}
}
}

\examples{
colorDF(mtcars)
print_colorDF(mtcars, row.names=FALSE)

if(require(dplyr)) {
    starwars \%>\% colorDF
    starwars \%>\% print_colorDF(highlight=.$homeworld == "Tatooine")

    ## equivalently
    starwars \%>\% highlight(.$homeworld == "Tatooine")

    ## with another style
    options(colorDF_theme="bw")
    starwars \%>\% print_colorDF(tibble_style=TRUE, sep=" |\%\%| ")
}
}
\seealso{
\code{\link[=df_style]{df_style()}} on how to modify colorful data frames styles;
\code{\link[=col_type]{col_type()}} on how to change the column types; \code{\link[=colorDF_themes_show]{colorDF_themes_show()}} to
demonstrate available themes; \code{\link[=highlight]{highlight()}} and \code{\link[=df_search]{df_search()}} functions on
how to use colorDF to highlight selected parts of a data frame.
}
