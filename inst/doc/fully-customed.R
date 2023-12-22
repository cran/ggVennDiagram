## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(ggVennDiagram)

## -----------------------------------------------------------------------------
genes <- paste0("gene",1:1000)
set.seed(20231214)
gene_list <- list(A = sample(genes,100),
                  B = sample(genes,200),
                  C = sample(genes,300),
                  D = sample(genes,200))

## -----------------------------------------------------------------------------
library(ggVennDiagram)
library(ggplot2)

## -----------------------------------------------------------------------------
venn <- Venn(gene_list)
data <- process_data(venn)
ggplot() +
  # 1. region count layer
  geom_polygon(aes(X, Y, fill = count, group = id), 
          data = venn_regionedge(data)) +
  # 2. set edge layer
  geom_path(aes(X, Y, color = id, group = id), 
          data = venn_setedge(data), 
          show.legend = FALSE) +
  # 3. set label layer
  geom_text(aes(X, Y, label = name), 
               data = venn_setlabel(data)) +
  # 4. region label layer
  geom_label(aes(X, Y, label = count), 
                data = venn_regionlabel(data)) +
  coord_equal() +
  theme_void()

## -----------------------------------------------------------------------------
data

## -----------------------------------------------------------------------------
ggplot() +
  # change mapping of color filling
  geom_polygon(aes(X, Y, fill = id, group = id), 
          data = venn_regionedge(data),
          show.legend = FALSE) +
  # adjust edge size and color
  geom_path(aes(X, Y, color = id, group = id), 
          data = venn_setedge(data), 
          linewidth = 3,
          show.legend = FALSE) +
  # show set label in bold
  geom_text(aes(X, Y, label = name), 
            fontface = "bold",
            data = venn_setlabel(data)) +
  # add a alternative region name
  geom_label(aes(X, Y, label = id), 
             data = venn_regionlabel(data),
             alpha = 0.5) +
  coord_equal() +
  theme_void()

