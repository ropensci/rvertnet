#' Trait focused search
#' 
#' @export
#' @inheritParams vertsearch
#' @param has_mass (logical) limit to records that have mass data (stored in 
#' \code{massing}). Default: \code{FALSE}
#' @param has_length (logical) limit to records that have length data (stored 
#' in \code{lengthinmm}). Default: \code{FALSE}
#' @param has_sex (logical) limit to records that have sex data (stored in 
#' \code{sex}). Default: \code{FALSE}
#' @param has_lifestage (logical) limit to records that have lifestage data
#' (stored in \code{lifestage}). Default: \code{FALSE}
#' @param length_type (character) length type, one of 'total length', 
#' 'standard length', 'snout-vent length', 'head-body length', 'fork length', 
#' 'total length range', 'standard length range', 'snout-vent length range',
#' 'head-body length range', 'fork length range'. (stored in \code{lengthtype}) 
#' Default: \code{NULL}
#' @param length (list) list of query terms for length, e.g., "< 100"
#' @param mass (list) list of query terms for mass, e.g., "< 100"
#' 
#' @details Wraps \code{\link{vertsearch}}, with some of the same parameters,
#' but with additional parameters added to make querying for traits easy.
#' 
#' @return a list, same as returned by \code{\link{vertsearch}}, with data
#' in the \code{data} slot
#' 
#' @examples
#' traitsearch(has_mass = TRUE, limit = 10)
#' traitsearch(has_length = TRUE, limit = 10)
#' traitsearch(has_sex = TRUE, limit = 10)
#' 
#' \dontrun{
#' traitsearch(has_lifestage = TRUE)
#' traitsearch(has_mass = TRUE, has_length = TRUE)
#' res <- traitsearch(length_type = "total length", 
#'   length = list(">= 300", "<= 1000"))
#' summary(as.numeric(res$data$lengthinmm))
#' res <- traitsearch(has_mass = TRUE, mass = list(">= 20", "<= 500"))
#' summary(as.numeric(res$data$massing))
#' 
#' traitsearch(taxon = "aves", has_mass = TRUE, limit = 100)
#' }
traitsearch <- function(taxon = NULL, has_mass = FALSE, has_length = FALSE, 
  has_sex = FALSE, has_lifestage = FALSE, length_type = NULL, length = NULL, 
  mass = NULL, limit = 1000, compact = TRUE, verbose = TRUE, ...) {
  
  vertsearch(
    taxon = taxon,
    if (has_mass) sprintf("hasmass:%s", ab(has_mass)), 
    if (has_length) sprintf("haslength:%s", ab(has_length)),
    if (has_sex) sprintf("hassex:%s", ab(has_sex)),
    if (has_lifestage) sprintf("haslifestage:%s", ab(has_lifestage)),
    if (!is.null(length_type)) sprintf("lengthtype:%s", length_type),
    if (!is.null(length)) handle_len_mass("lengthinmm", length),
    if (!is.null(mass)) handle_len_mass("massing", mass),
    ..., limit = limit, compact = compact, verbose = verbose, only_dwc = FALSE
  )
}

handle_len_mass <- function(name, z) {
  paste0(vapply(z, function(x) paste(name, x), ""), collapse = " ")
}
