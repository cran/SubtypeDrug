% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotDSpwHeatmap.R
\name{plotDSpwHeatmap}
\alias{plotDSpwHeatmap}
\title{Plot heat map of the drug regulated subpathway activity score}
\usage{
plotDSpwHeatmap(
  data,
  drug.label = "",
  subtype.label = "",
  show.rownames = TRUE,
  show.colnames = TRUE,
  color = NA,
  phen_colors = NA,
  border_color = "grey60",
  cellwidth = NA,
  cellheight = NA,
  fontsize = 10,
  fontsize.row = 10,
  fontsize.col = 10,
  scale = "row"
)
}
\arguments{
\item{data}{A list of result data generated by function `PrioSubtypeDrug()`.}

\item{drug.label}{A character string of drug labels to determine which drug to use for visualization.}

\item{subtype.label}{Character string indicates which sample of the cancer subtype was used to plot the heat map.}

\item{show.rownames}{Boolean specifying if row names are be shown.}

\item{show.colnames}{Boolean specifying if column names are be shown.}

\item{color}{Vector of colors used in heatmap.}

\item{phen_colors}{Vector of colors is used to annotate the sample subtype and control sample.It should be assigned two colors.}

\item{border_color}{Color of cell borders on heatmap, use NA if no border should be drawn.}

\item{cellwidth}{Individual cell width in points. If left as NA, then the values depend on the size of plotting window.}

\item{cellheight}{Individual cell height in points. If left as NA, then the values depend on the size of plotting window.}

\item{fontsize}{Base fontsize for the plot (default: 10).}

\item{fontsize.row}{Fontsize for rownames (default: 10).}

\item{fontsize.col}{Fontsize for colnames (default: 10).}

\item{scale}{Character indicating if the values should be centered and scaled in either the row direction or the column direction, or none. Corresponding values are "row", "column" and "none".}
}
\value{
A heat map.
}
\description{
The `plotDSpwHeatmap()` function plots a heat map of the subpathways that are regulated by specified drug and have
differential expression between specified cancer subtype and normal.
}
\details{
plotDSpwHeatmap


Based on the input cancer subtype, the program draws a heat map of the drug regulated subpathway activity
score. If the cancer subtype of input has sutype-specific drug score (SDS)<0,
we can observe the drug upregulatory subpathway is lowly expressed in the cancer subtype samples and high in the normal samples;
the drug downregulatory subpathway is highly expressed in the cancer subtype samples and low in the normal samples. This indicates that after the drug action,
these subpathways activity is converted from the level of the cancer subtype into the level of normal. If the cancer subtype of input has sutype-specific drug
score (SDS)>0, it is indicated that the drug action may promote the subpathway expression status of the cancer subtype.
}
\examples{
require(pheatmap)
## Get the result data of PrioSubtypeDrug().
## The data is based on the simulated breast cancer subtype data.
Subtype_drugs<-get("Subtype_drugs")
plotDSpwHeatmap(data=Subtype_drugs,drug.label="pirenperone(1.02e-05M)",subtype.label="Basal")
##Visualize the results of only two types of samples.
Disease_drugs<-get("Disease_drugs")
plotDSpwHeatmap(data=Disease_drugs,drug.label="W-13(1e-05M)",subtype.label="Cancer")
}
\author{
Xudong Han,
Junwei Han,
Chonghui Liu
}
