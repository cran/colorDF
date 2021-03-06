% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tools.R
\name{highlight}
\alias{highlight}
\title{Highlight some rows in a data frame}
\usage{
highlight(x, sel)
}
\arguments{
\item{x}{data frame like object}

\item{sel}{logical vector of length equal to number of rows in the data frame.}
}
\description{
Highlight some rows in a data frame
}
\details{
Uses \code{\link[=print.colorDF]{print.colorDF()}} to highlight selected rows in a data frame.
}
\examples{
highlight(mtcars, mtcars$cyl == 6)
}
