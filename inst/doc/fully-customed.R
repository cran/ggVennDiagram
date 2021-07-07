## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(ggVennDiagram)

## -----------------------------------------------------------------------------
genes <- paste0("gene",1:1000)
set.seed(20210302)
gene_list <- list(A = sample(genes,100),
                  B = sample(genes,200),
                  C = sample(genes,300),
                  D = sample(genes,200))

library(ggVennDiagram)
library(ggplot2)

## -----------------------------------------------------------------------------
venn <- Venn(gene_list)
data <- process_data(venn)
ggplot() +
  # 1. region count layer
  geom_sf(aes(fill = count), data = venn_region(data)) +
  # 2. set edge layer
  geom_sf(aes(color = id), data = venn_setedge(data), show.legend = FALSE) +
  # 3. set label layer
  geom_sf_text(aes(label = name), data = venn_setlabel(data)) +
  # 4. region label layer
  geom_sf_label(aes(label = count), data = venn_region(data)) +
  theme_void()

## -----------------------------------------------------------------------------
data

## -----------------------------------------------------------------------------
ggplot() +
  # change mapping of color filling
  geom_sf(aes(fill = id), data = venn_region(data), show.legend = FALSE) +  
  # adjust edge size and color
  geom_sf(color="grey", size = 3, data = venn_setedge(data), show.legend = FALSE) +  
  # show set label in bold
  geom_sf_text(aes(label = name), fontface = "bold", data = venn_setlabel(data)) +  
  # add a alternative region name
  geom_sf_label(aes(label = name), data = venn_region(data), alpha = 0.5) +  
  theme_void()

