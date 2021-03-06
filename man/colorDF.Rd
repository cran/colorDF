% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/classes.R
\name{colorDF}
\alias{colorDF}
\alias{as.colorDF}
\title{Make a dataframe colorful}
\usage{
colorDF(x, theme = NULL)

as.colorDF(x, ...)
}
\arguments{
\item{x}{a data frame or similar object, e.g. tibble, data.table or any
object for which as.data.frame call returns a data frame}

\item{theme}{Which theme to use}

\item{...}{further arguments are passed to \code{\link[=colorDF]{colorDF()}}.}
}
\value{
a colorful data frame – identical object but with the \code{.style}
attribute set and class "colorDF" added.
}
\description{
Make a dataframe colorful
}
\details{
These functions turn any data frame like object (i.e. object which
inherits the data.frame class, such as a \link[tibble:tibble]{tibble} or
a \link[data.table:data.table]{data table}).

Apart from adding the S3 class "colorDF", the \code{.style} attribute (and
later the \code{.coltp} attribute), the only thing that really changes is
the print method (see \code{\link[=print_colorDF]{print_colorDF()}}). In other words, the behavior
of the object does not change (e.g., a \code{\link[base:data.frame]{base::data.frame()}} will by the default
drop dimensions if one column is selected, while a \code{\link[tibble:tibble]{tibble::tibble()}} will
not). colorDF is just for visualization, never truly manipulation.

Several color themes come with the package; see \code{\link[=colorDF_themes_show]{colorDF_themes_show()}}.
When creating a colorful data frame, a theme might be directly selected;
otherwise the \code{getOption("colorDF_theme")} is consulted and if NULL, a
default theme will be selected. The theme associated with an object
becomes a style and can be further manipulated (see \code{\link[=df_style]{df_style()}}).

\code{\link[=as.colorDF]{as.colorDF()}} calls \code{\link[=colorDF]{colorDF()}}; this function is only here for
completeness.
}
\examples{
colorDF(mtcars)
colorDF(mtcars, theme="bw")
}
\seealso{
\link[=colorDF-package]{Introduction to the package};
\code{\link[=df_style]{df_style()}} on how to modify style of the colorful data frame;
\code{\link[=col_type]{col_type()}} on how to change column types;
\code{\link[=colorDF_themes]{colorDF_themes()}} to list all themes; \code{\link[=colorDF_themes_show]{colorDF_themes_show()}}
to view all themes.
}
