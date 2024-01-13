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

## -----------------------------------------------------------------------------
set.seed(20231225)
y = list(
  A = sample(letters, 8) |> sort(),
  B = sample(letters, 8) |> sort(),
  C = sample(letters, 8) |> sort(),
  D = sample(letters, 8) |> sort())

# view the list
y

## -----------------------------------------------------------------------------
ggVennDiagram(y, show_intersect = TRUE, set_color = "black")

## -----------------------------------------------------------------------------
venn_y = Venn(y)

venn_y

## -----------------------------------------------------------------------------
# find the overlaping members of two or more sets
overlap(venn_y, 1:2) # members in both the first two sets
overlap(venn_y) # members in all the sets

# find the different members between sets and set unions
discern(venn_y, 1)  # members in set 1, but not in all the resting sets by default
discern(venn_y, c("A","B"), 3) # members in set A & B, but not in the third set

# find the specific members in one or more sets
discern_overlap(venn_y, 1)  # specific items in set 1, equals to `discern(venn_y, 1)`. Those members are not shared by all the other sets.
discern_overlap(venn_y, 1:2)  # specific items in set 1 and set 2

## -----------------------------------------------------------------------------
venn_plot_data = process_data(venn_y)

# summary of VennPlotData object
venn_plot_data

## -----------------------------------------------------------------------------
# get the set data
venn_set(venn_plot_data)

# get subsets, i.e., regions
venn_region(venn_plot_data)

## -----------------------------------------------------------------------------
# get set edge
venn_setedge(venn_plot_data)

# get region edge
venn_regionedge(venn_plot_data)

## -----------------------------------------------------------------------------
df = venn_setedge(venn_plot_data)
plot(df$X, df$Y, asp = 1)

