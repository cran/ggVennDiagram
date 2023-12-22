## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(ggVennDiagram)

## -----------------------------------------------------------------------------
shape1 = ggVennDiagram:::shapes[[4]]
shape1

## -----------------------------------------------------------------------------
plot_shape_edge(shape1)

## -----------------------------------------------------------------------------
get_shapes()

## -----------------------------------------------------------------------------
library(ggplot2)
shape2 = get_shape_by_id("401f")
plot_shape_edge(shape2)

## -----------------------------------------------------------------------------
plot_shapes()

## -----------------------------------------------------------------------------
# Generate example data.
genes <- paste0("gene",1:1000)
set.seed(20210701)
gene_list <- list(A = sample(genes,100),
                  B = sample(genes,200),
                  C = sample(genes,300),
                  D = sample(genes,200))

# construct a Venn object
venn = Venn(gene_list)
data = process_data(venn, shape_id = "402")
plot_venn(data)

