## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(ggVennDiagram)
set.seed(20231225)
y = list(
  A = sample(letters, 8) |> sort(),
  B = sample(letters, 8) |> sort(),
  C = sample(letters, 8) |> sort(),
  D = sample(letters, 8) |> sort())

y

## -----------------------------------------------------------------------------
venn_y = Venn(y)

venn_y

## -----------------------------------------------------------------------------
overlap(venn_y, 1:2) # members in both the first two sets
overlap(venn_y) # members in all the sets

## -----------------------------------------------------------------------------
discern(venn_y, 1)  # members in set 1, but not in the resting sets
discern(venn_y, c("A","B"), 3) # members in set A & B, but not in the 3rd set

## -----------------------------------------------------------------------------
discern_overlap(venn_y, 1)  # specific items in set 1
discern_overlap(venn_y, 1:2)  # specific items in set 1 and set 2

## -----------------------------------------------------------------------------
unite(venn_y, 1:2) # union of set 1 and 2
unite(venn_y, "all") # union of all four sets
unite(venn_y, c("A", "B", "C"))

## -----------------------------------------------------------------------------
pd = process_data(venn_y)
pd

## -----------------------------------------------------------------------------
venn_set(pd)

## -----------------------------------------------------------------------------
venn_region(pd)

## -----------------------------------------------------------------------------
venn_region(pd) |> tidyr::unnest(item)

## -----------------------------------------------------------------------------
venn_region(pd) |> dplyr::rowwise() |> dplyr::mutate(item = paste0(item, collapse = ", "))

