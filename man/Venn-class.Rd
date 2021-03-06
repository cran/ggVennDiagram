% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Construct.R
\docType{class}
\name{Venn-class}
\alias{Venn-class}
\title{An S4 class to represent multiple sets.}
\description{
This class is adopted from `RVenn`. Since `RVenn` doesn't export this class,
I have to copy its codes hereafter to use it.
}
\section{Slots}{

\describe{
\item{\code{sets}}{A \code{list} object containing vectors in the same type.}

\item{\code{names}}{The names of the \code{sets} if it has names. If the \code{list}
doesn't have names, the sets will be named as "Set_1", "Set_2", "Set_3" and
so on.}
}}

