## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(ggVennDiagram)
library(ggplot2)

## -----------------------------------------------------------------------------
genes <- paste0("gene",1:1000)
set.seed(20210507)
x <- list(A = sample(genes,100),
          B = sample(genes,150),
          C = sample(genes,200),
          D = sample(genes,250),
          E = sample(genes,300),
          F = sample(genes,350),
          G = sample(genes,400))

## -----------------------------------------------------------------------------
ggVennDiagram(x, label = "none", edge_size = 1) + scale_fill_distiller(palette = "RdBu")
ggVennDiagram(x[1:6], label = "none", edge_size = 1) + scale_fill_distiller(palette = "RdBu")
ggVennDiagram(x[1:5], label = "none", edge_size = 1) + scale_fill_distiller(palette = "RdBu")

