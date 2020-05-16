##' plotDrugStructure
##'
##'
##' @title Visualize the chemical structure of the drug
##' @description `plotDrugStructure()` outputs the chemical structure graph of the
##' drug or compound based on the input drug label by the user.
##' @param drug.label A character string of drug label to determine which drug to use for visualization.
##' @param main An overall title for the chemical structure graph.
##' @param sub A sub title for the chemical structure graph.
##' @param cex.main The magnification to be used for main titles (default: 1.5).
##' @param cex.sub The magnification to be used for sub titles relative to the
##' current setting of cex.
##' @return A plot.
##' @author Xudong Han,
##' Junwei Han,
##' Chonghui Liu
##' @examples
##' \donttest{require(rvest)}
##' \donttest{require(ChemmineR)}
##' # Plot the chemical structure of drug beclometasone.
##' \donttest{plotDrugStructure(drug.label="pirenperone(1.02e-05M)")}
##' @importFrom ChemmineR read.SDFset
##' @importFrom rvest html_text
##' @importFrom xml2 read_html
##' @importFrom graphics plot
##' @export

plotDrugStructure<-function(drug.label="",main="",sub="",cex.main=1.5,cex.sub=1){
  haveChemmineR <- isPackageLoaded("ChemmineR")
  havervest <- isPackageLoaded("rvest")
  if(haveChemmineR==FALSE){
    stop("The 'ChemmineR' library, should be loaded first")
  }
  if(havervest==FALSE){
    stop("The 'rvest' library, should be loaded first")
  }
  drug.label<-unlist(strsplit(drug.label,"\\("))[1]
  drug.label1<-tolower(drug.label)
  Drugs_CID<-get("Drugs_CID")
  drugCid<-Drugs_CID[which(Drugs_CID[,1]==drug.label1),2]
  drug_url<-paste("https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/CID/",drugCid,"/record/SDF/?record_type=2d&response_type=display",sep = "")
  cw<-try(read_html(drug_url))
  if ('try-error' %in% class(cw)){
    stop("Please ensure smooth network connection")
  }
  drugnr<-read_html(drug_url)
  drugnr<-html_text(drugnr)
  drugnr<-strsplit(drugnr,"\n")
  drugnr<-unlist(drugnr)
  sdfset <- read.SDFset(drugnr)
  if(main==""){
    sdfset@ID <- drug.label
  }else{
    sdfset@ID <- main
  }
  if(sub==""){
     plot(sdfset,print=FALSE,cex.main=cex.main,cex.sub=cex.sub)
  }else{
    plot(sdfset,print=FALSE,sub=sub,cex.main=cex.main,cex.sub=cex.sub)
  }

}
