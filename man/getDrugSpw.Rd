% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getDrugSpw.R
\name{getDrugSpw}
\alias{getDrugSpw}
\title{SubtypeDrug internal function}
\usage{
getDrugSpw(
  drug_target_data,
  spw_matrix_rnames,
  drug.P.value.threshold,
  drug.min.sz,
  drug.max.sz
)
}
\arguments{
\item{drug_target_data}{A list. A list stores a collection of drug up- and down-regulated subpathways.}

\item{spw_matrix_rnames}{A vector. A vector consisting of row names of subpathway activity profile.}

\item{drug.P.value.threshold}{A value. According to the threshold of the significant P value set by parameter `drug.p.val.threshold`, the drug up-regulation and down-regulatory subpathways were screened.}

\item{drug.min.sz}{A numeric. The drug regulated subpathways intersects with the subpathways in the subpathway activity profile. Then drugs with less than `drug.spw.min.sz` up- or down-regulated subpathways are removed.}

\item{drug.max.sz}{A numeric. Similar to parameter `drug.spw.min.sz`, drugs with more than `drug.spw.max.sz` up- or down-regulated subpathways are removed.}
}
\value{
a list.
}
\description{
According to the parameters set by the user, the up-regulatory
and down-regulatory subpathway data of drug is obtained.
}
\details{
getDrugSpw
}
\examples{
require(GSVA)
Geneexp<-get("Geneexp")
UserGS<-get("UserGS")
UserDS<-get("UserDS")
gsvaPar <- GSVA::ssgseaParam(Geneexp,UserGS,minSize=2)
spw_matrix<-gsva(gsvaPar)
x<-getDrugSpw(UserDS,row.names(spw_matrix),0.05,1,100)
}
\author{
Xudong Han,
Junwei Han,
Chonghui Liu
}
