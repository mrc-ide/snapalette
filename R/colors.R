#' Complete list of palettes
#'
#' Use \code{\link{snapalette}} to construct palettes of desired length.
#'
#' @export
#' 
snapalettes <- list(
  Mosaic = c("#204D8C", "#35648C", "#D9B777", "#BF9765", "#732720"),
  EspiritoSanta = c("#599DD9", "#24897E", "#F2D8A7", "#F2B035", "#F27649"),
  ST_art = c("#5C5F73", "#2D3340", "#664830", "#F6A894", "#FFFEE9"),
  DiscoverySuites = c("#025959","#0B8C8C","#CEDEF2", "#D98E04", "#D97904"),
  IpanemaSunset = c("#F2E96B", "#F2D06B", "#F2BC8C", "#D99379", "#F26430"),
  Orchid = c("#730217", "#A6033F", "#4F7302", "#D9A13B", "#D95F18"),
  CaveHouse = c("#40050A", "#D92332", "#F24464", "#1755A6", "#F2C46D"),
  Kalypso = c("#A6033F", "#D91A96", "#75DEFF", "#50A7F2", "#143F8C"),
  ThiraJazz = c( "#0E2F73", "#1445A6", "#D9A648", "#D97925", "#BF5E26"),
  Camden = c("#4C3677", "#C84554", "#B1C0D7", "#A88C40", "#E9B234"),
  Venice = c("#081955", "#2E4866", "#F2D8C9", "#F4BB68", "#3F2419"),
  Barcelona = c("#D90D32", "#5207F2", "#1D1073", "#F2AE2E", "#591914"),
  Fjord = c("#0D3973",  "#4B7BA6", "#F2E9E9", "#AFAD50","#02260B"),
  Stavanger = c("#5274D9", "#F2CB05", "#D95204", "#A62103", "#400101"),
  SweetShop = c("#F2507B", "#1D4B73", "#BFB965", "#BF8E34", "#730707"),
  Wales = c("#BFA3A3", "#F2E8Dc", "#484F66", "#A65C37", "#734040"),
  SzimplaKert = c("#265902", "#F2AE2E", "#F27507", "#732C02", "#F23005"),
  BudapestCitadel = c("#6F8ABF", "#D9C8B4", "#D99559", "#BF4E24", "#A63117"),
  Ipanema = c("#1F5AA6", "#72B6F2", "#88C9F2", "#F2CB05", "#734002"),
  Bouquet = c("#571673", "#8C5884", "#D3BFD9", "#AFBF30", "#667302"),
  Pop = c("#2a3950", "#464c5a", "#bdc6cb", "#e1e2e4", "#eebc25"),
  Space = c("#0d1218", "#35374c", "#96698a", "#d9c5d4", "#8ef2f0"),
  Ember = c("#2a3950", "#41436a", "#974063", "#f54768", "#ff9678"),
  Tree5 = c("#141A8C", "#B6BFF2", "#F29F05", "#F27405", "#731702"),
  Tree3 = c("#400112", "#D92B8B", "#BF05F2", "#0511F2", "#021373"),
  Charleston = c("#0D0D0D", "#435373", "#F2CA50", "#F2CEA2", "#F28444"),
  
  vimc_dis = c("#466EE7","#D19E5C","#EF4050","#E7BF44","#3EEFE1","#9573B5","#F3DFA2",
               "#645CD1", "#C9D15C","#D15B8F","#6F3B3A","#EFE13E")
)


#' A palette generator from my holiday snaps
#' @references https://github.com/karthik/wesanderson
#'
#' @param n Number of colors desired. 
#' @param name Name of desired palette. Choices are:
#' @param type Either "continuous" or "discrete". Use continuous if you want
#'   to automatically interpolate between colours.
#'   @importFrom graphics rgb rect par image text
#' @return A vector of colours.
#' @export
#' @keywords colors
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

#' function for showing palettes
#' @param x palette
#' 
#' @export
print.palette <- function(x) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))
  
  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")
  
  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "serif")
}
