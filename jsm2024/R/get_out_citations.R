# Generated from create-jsm2024.Rmd: do not edit by hand

#' Return the JSM authors that this JSM author cites
#' 
#' For some authors (particularly new ones), it can be useful to augment their
#' citations with those of coauthors.  Use `augment=TRUE` for this.
#' 
#' @param name name of a JSM author
#' @param augment should we include out citations of coauthors?
#' 
#' @export
get_out_citations <- function(name, augment = FALSE) {
  ii <- which(jsm2024::authors == name)
  if (length(ii) == 0) {
    message("Author not found.")
    return(character(0))
  }
  ii_cites <- ordered_nz(jsm2024::cites[ii, ])
  if (augment) {
    ii_coa <- ordered_nz(jsm2024::coauthor[ii, ])
    # weighted sum of who the coauthors cite (weighted by coauthor strength):
    wtd <- jsm2024::coauthor[ii, ii_coa] %*% jsm2024::cites[ii_coa, ]
    ii_coa_cites <- ordered_nz(as.numeric(wtd))
    # start with author's own cites and follow with those of coauthors:
    ii_cites <- c(ii_cites, setdiff(ii_coa_cites, ii_cites))
  }
  intersect(jsm2024::authors[ii_cites], jsm2024::authors2024)
}
