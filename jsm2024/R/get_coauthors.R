# Generated from create-jsm2024.Rmd: do not edit by hand

#' Return the JSM authors who are co-authors
#' 
#' @param name name of a JSM author
#' 
#' @export
get_coauthors <- function(name) {
  ii <- which(jsm2024::authors == name)
  if (length(ii) == 0) {
    message("Author not found.")
    return(character(0))
  }
  ii_coa <- ordered_nz(jsm2024::coauthor[ii, ])
  jsm2024::authors[ii_coa]
}
