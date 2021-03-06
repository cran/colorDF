% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tools.R
\name{df_search}
\alias{df_search}
\title{Search and highlight occurences of a pattern}
\usage{
df_search(x, pattern = NULL, cols = NULL)
}
\arguments{
\item{x}{a data frame}

\item{pattern}{a pattern; if NULL, the search results will be removed}

\item{cols}{which columns to search for (if NULL, all columns will be searched)}
}
\value{
a color data frame object with the search pattern set for the given columns (or reset, if the pattern was NULL)
}
\description{
Search and highlight occurences of a pattern in a data frame
}
\details{
df_search is for highlighting cells matching a specific pattern.
}
\examples{
options(colorDF_tibble_style=TRUE)
if(require(dplyr)) {

  # Search for "blue" in any column
  starwars \%>\% df_search("blue")

  # Search in a specific column
  starwars \%>\% df_search("(Human|Wookie)", "species")

  # save the search pattern in a new object
  saved <- starwars \%>\% df_search("blue")

  # remove the search patterns
  saved <- df_search(saved)
}
}
