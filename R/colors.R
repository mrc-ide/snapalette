#' Complete list of palettes
#'
#' Use \code{\link{snapalette}} to construct palettes of desired length.
#'
#' @export
snapalettes <- list(
  Mosaic = c("#204D8C", "#35648C", "#D9B777", "#BF9765", "#732720"),
  EspiritoSanta = c("#599DD9", "#24897E", "#F2D8A7", "#F2B035", "#F27649"),
  ST_art = c("#5C5F73", "#2D3340", "#664830", "#F6A894", "#FFFEE9"),
  DiscoverySuites = c("#CEDEF2", "#0B8C8C", "#025959", "#D98E04", "#D97904"),
  IpanemaSunset = c("#F2E96B", "#F2D06B", "#F2BC8C", "#D99379", "#F26430"),
  Orchid = c("#730217", "#A6033F", "#4F7302", "#D9A13B", "#D95F18"),
  CaveHouse = c("#40050A", "#D92332", "#F24464", "#1755A6", "#F2C46D"),
  Kalypso = c("#A6033F", "#D91A96", "#75DEFF", "#50A7F2", "#143F8C"),
  ThiraJazz = c("#1445A6", "#0E2F73", "#D9A648", "#D97925", "#BF5E26"),
  Camden = c("#4C3677", "#C84554", "#B1C0D7", "#A88C40", "#E9B234"),
  Venice = c("#081955", "#2E4866", "#3F2419", "#F4BB68", "#F2D8C9"),
  Barcelona = c("#D90D32", "#5207F2", "#1D1073", "#F2AE2E", "#591914"),
  Fjord = c("#0D3973", "#AFAD50", "#4B7BA6", "#02260B", "#F2E9E9"),
  Stavanger = c("#5274D9", "#F2CB05", "#D95204", "#A62103", "#400101"),
  SweetShop = c("#F2507B", "#1D4B73", "#BFB965", "#BF8E34", "#730707"),
  Wales = c("#BFA3A3", "#F2E8Dc", "#484F66", "#A65C37", "#734040"),
  SzimplaKert = c("#265902", "#F2AE2E", "#F27507", "#732C02", "#F23005"),
  BudapestCitadel = c("#6F8ABF", "#D9C8B4", "#D99559", "#BF4E24", "#A63117"),
  Ipanema = c("#1F5AA6", "#72B6F2", "#88C9F2", "#F2CB05", "#734002")
)


#' A palette generator from my holiday snaps
#' Based on the wesanderson package
#'
#' @param n Number of colors desired. 
#' @param name Name of desired palette. Choices are:
#' @param type Either "continuous" or "discrete". Use continuous if you want
#'   to automatically interpolate between colours.
#'   @importFrom graphics rgb rect par image text
#' @return A vector of colours.
#' @export
#' @keywords colors
#' @examples
snapalette <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)
  
  pal <- snapalettes[[name]]
  if (is.null(pal))
    stop("Palette not found.")
  
  if (missing(n)) {
    n <- length(pal)
  }
  
  if (type == "discrete" && n > length(pal)) {
    stop("Number of requested colors greater than what palette can offer")
  }
  
  out <- switch(type,
                continuous = grDevices::colorRampPalette(pal)(n),
                discrete = pal[1:n]
  )
  structure(out, class = "palette", name = name)
}

#' @export
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))
  
  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")
  
  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "serif")
}