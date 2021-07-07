## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(ggVennDiagram)

## -----------------------------------------------------------------------------
ggVennDiagram:::shapes
library(ggplot2)

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
data = process_data(venn, shape_id == "401")

ggplot() +
  geom_sf(aes(fill = count), data = venn_region(data)) +
  geom_sf(aes(color = id), data = venn_setedge(data), show.legend = FALSE) +
  geom_sf_text(aes(label = name), data = venn_setlabel(data)) +
  geom_sf_label(aes(label = count), data = venn_region(data)) +
  theme_void()

## ----echo=FALSE---------------------------------------------------------------
# I have to use a copy here
svg_url = "https://vnote-1251564393.cos.ap-chengdu.myqcloud.com/typora-img/triangles.svg"
knitr::include_graphics(svg_url)

## -----------------------------------------------------------------------------
# the vertext coordinates of six triangles
vertex_coordinates <- list(c(-69277,-32868,135580,121186, 70900,199427),
                   c( 81988,-44426, 38444,206222,121044,165111),
                   c(203271,  9619, 39604, 82683, 84652,206669),
                   c(333561,225349, 61764, 76805, 38980,182461),
                   c(131886,385785, 38136,111491, 94208, 24690),
                   c(-60184,274046,142476, 39903,103276,183962))

triangles <- lapply(vertex_coordinates, triangle)

## -----------------------------------------------------------------------------
position <- tibble::tribble(
      ~x,       ~y,
      -50000,     50000,
      60000,          0,
      160000,     20000,
      280000,    170000,
      140000,    300000,
      -20000,   270000
    )
label_position = label_position(position)

## -----------------------------------------------------------------------------
shape = VennPlotData(setEdge = triangles,
                     setLabel = label_position)


## -----------------------------------------------------------------------------
genes <- paste0("gene",1:1000)
set.seed(20210701)
x <- list(A = sample(genes,100),
          B = sample(genes,150),
          C = sample(genes,200),
          D = sample(genes,250),
          E = sample(genes,300),
          F = sample(genes,350))
venn = Venn(x)

data = plotData_add_venn(plotData = shape, venn = venn)

## ----fig.width=10-------------------------------------------------------------
ggplot() +
  geom_sf(aes(fill = count), data = venn_region(data)) +
  geom_sf(aes(color = name), size = 2, data = venn_setedge(data)) +
  geom_sf_text(aes(label = name), data = venn_setlabel(data)) +
  theme_void() +
  labs(color = "Set Name", fill = "Count")

