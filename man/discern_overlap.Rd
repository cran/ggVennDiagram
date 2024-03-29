% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/setOperations.R
\name{discern_overlap}
\alias{discern_overlap}
\alias{discern_overlap,Venn-method}
\title{Calculate region of sets}
\usage{
discern_overlap(venn, slice = "all")

\S4method{discern_overlap}{Venn}(venn, slice = "all")
}
\arguments{
\item{venn}{a Venn object}

\item{slice}{index of Venn members, default is "all"}
}
\value{
region items
}
\description{
calculate the unique region defined
by `Venn` object and the parameter `slice`.
}
\examples{
library(ggVennDiagram)
venn <- Venn(list(A=1:3,B=2:5,C=c(1L,3L,5L)))

discern_overlap(venn, slice = "all")
# is equal to
overlap(venn, slice = "all")

# however, `discern_overlap()` only contains specific region
discern_overlap(venn, slice = 1:2)
# is different from
overlap(venn, slice = 1:2)
}
\author{
gaospecial@gmail.com
}
