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

## -----------------------------------------------------------------------------
venn <- Venn(gene_list)
data <- process_data(venn)
items <- venn_region(data) %>%
  dplyr::rowwise() %>%
  dplyr::mutate(text = stringr::str_wrap(paste0(.data$item, collapse = " "),
                                         width = 40)) %>%
  sf::st_as_sf()
label_coord = sf::st_centroid(items$geometry) %>% sf::st_coordinates()
p <- ggplot(items) +
  geom_sf(aes_string(fill="count")) +
  geom_sf_text(aes_string(label = "name"),
               data = data@setLabel,
               inherit.aes = F) +
  geom_text(aes_string(label = "count", text = "text"),
            x = label_coord[,1],
            y = label_coord[,2],
            show.legend = FALSE) +
  theme_void() +
  scale_fill_distiller(palette = "RdBu")
ax <- list(
  showline = FALSE
)
plotly::ggplotly(p, tooltip = c("text")) %>%
  plotly::layout(xaxis = ax, yaxis = ax)

