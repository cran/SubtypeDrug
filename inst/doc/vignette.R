## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(SubtypeDrug)

## -----------------------------------------------------------------------------
require(GSVA)
require(parallel)
## Get simulated breast cancer gene expression profile data.
Geneexp<-get("Geneexp")
## Obtain sample subtype data and calculate breast cancer subtype-specific drugs.
Subtype_labels<-system.file("extdata", "Subtype_labels.cls", package = "SubtypeDrug")

## ----include=FALSE,echo=F-----------------------------------------------------
Subtype_drugs<-get("Subtype_drugs")

## -----------------------------------------------------------------------------
## Results display.
str(Subtype_drugs)

## -----------------------------------------------------------------------------
## User-defined drug regulation data should resemble the structure below.
UserDS<-get("UserDS")
str(UserDS[1:5])
## Need to load gene set data consistent with drug regulation data.
UserGS<-get("UserGS")
str(UserGS[1:5])
Drugs<-OCSSD(Geneexp,Subtype_labels,"Control",UserGS,input.drug.data=UserDS,parallel.sz=1)

## ----fig.height=6, fig.width=10, message=FALSE, warning=FALSE-----------------
require(pheatmap)
## Heat map of normalized disease-drug reverse association scores for all subtype-specific drugs.
plotDScoreHeatmap(data=Subtype_drugs,show.rownames = TRUE,show.colnames = FALSE)

## ----fig.height=3, fig.width=10, message=FALSE, warning=FALSE-----------------
## Plot only Basal subtype-specific drugs.
plotDScoreHeatmap(data=Subtype_drugs,subtype.label="Basal",show.rownames = TRUE,show.colnames = FALSE)

## ----fig.height=8, fig.width=10-----------------------------------------------
## Plot a heat map of the individualized activity aberrance scores of subpathway regulated by drug pirenperone(1.02e-05M). 
## Basal-specific drugs pirenperone(1.02e-05M) regulated subpathways that show opposite activity from normal samples.
plotDSpwHeatmap(data=Subtype_drugs,drug.label="pirenperone(1.02e-05M)",subtype.label="Basal",show.colnames=FALSE)

## ----fig.height=8, fig.width=9------------------------------------------------
## Plot a global graph of the Basal-specific drug pirenperone(1.02e-05M).
plotGlobalGraph(data=Subtype_drugs,drug.label="pirenperone(1.02e-05M)")

## ----fig.height=6, fig.width=6, message=FALSE, warning=FALSE------------------
require(igraph)
# plot network graph of the subpathway 00020_4.
plotSpwNetGraph(spwid="00020_4")

## ----echo=FALSE---------------------------------------------------------------
knitr::include_graphics("../inst/pirenperone(1.02e-05M).jpeg")

