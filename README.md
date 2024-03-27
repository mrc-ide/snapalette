Holiday snap palettes
=====================

Here are some pallettes I have made from my own holiday snaps. This is
based on the excellent wespalette package and is for personal use only.

Installation
------------

``` r
remotes::install_github("mrc-ide/snapalette")
```

Usage
-----

``` r
library(snapalette)
# See all palettes
names(snapalettes)
#>  [1] "Mosaic"          "EspiritoSanta"   "ST_art"         
#>  [4] "DiscoverySuites" "IpanemaSunset"   "Orchid"         
#>  [7] "CaveHouse"       "Kalypso"         "ThiraJazz"      
#> [10] "Camden"          "Venice"          "Barcelona"      
#> [13] "Fjord"           "Stavanger"       "SweetShop"      
#> [16] "Wales"           "SzimplaKert"     "BudapestCitadel"
#> [19] "Ipanema"         "Bouquet"         "Pop"            
#> [22] "Space"           "Ember"           "Tree5"          
#> [25] "Tree3"           "Charleston"      "sph_building"
```

Palettes
--------

### Mosaic from Fiocruz

``` r
snapalette("Mosaic")
```

![](figure/mosaic-1.png)

### EspiritoSanta

``` r
snapalette("EspiritoSanta")
```

![](figure/espirito-1.png)

### Street art

``` r
snapalette("ST_art")
```

![](figure/royal-1.png)

### Discovery Suites

``` r
snapalette("DiscoverySuites")
```

![](figure/discovery-1.png)

### Ipanama sunset

``` r
snapalette("IpanemaSunset")
```

![](figure/sunset-1.png)

### Orchid

``` r
snapalette("Orchid")
```

![](figure/orchid-1.png)

### Greek cave house

``` r
snapalette("CaveHouse")
```

![](figure/Cave-1.png)

### Kalypso

``` r
snapalette("Kalypso")
```

![](figure/Kalypso-1.png)

``` r
pal <- snapalette("Kalypso", 21, type = "continuous")
image(volcano, col = rev(pal))
```

![](figure/volcano-1.png)

### ThiraJazz

``` r
snapalette("ThiraJazz")
```

![](figure/jazz-1.png)

### Camden

``` r
snapalette("Camden")
```

![](figure/Camden-1.png)

### Venice

``` r
snapalette("Venice")
```

![](figure/venice-1.png)

### Barcelona

``` r
snapalette("Barcelona")
```

![](figure/Barcelona-1.png)

``` r
library("ggplot2")
ggplot(mtcars, aes(factor(cyl), fill=factor(gear))) +  geom_bar() +
scale_fill_manual(values =snapalette("Barcelona"))
```

![](figure/ggplot-1.png)

### Fjord

``` r
snapalette("Fjord")
```

![](figure/fjord-1.png)

### Stavanger

``` r
snapalette("Stavanger")
```

![](figure/stavanger-1.png)

### Sweet Shop

``` r
snapalette("SweetShop")
```

![](figure/sweetshop-1.png)

### Wales

``` r
snapalette("Wales")
```

![](figure/wales-1.png)

### Szimpla Kert

``` r
snapalette("SzimplaKert")
```

![](figure/szimpla-1.png)

### Budapest Citadel

``` r
snapalette("BudapestCitadel")
```

![](figure/citadel-1.png)

### Ipanema

``` r
snapalette("Ipanema")
```

![](figure/ipanema-1.png)

### Bouquet

``` r
snapalette("Bouquet")
```

![](figure/bouquet-1.png)

### Pop

``` r
snapalette("Pop")
```

![](figure/pop-1.png)

### Space

``` r
snapalette("Space")
```

![](figure/space-1.png)

### Ember

``` r
snapalette("Ember")
```

![](figure/ember-1.png)

### Tree5

``` r
snapalette("Tree5")
```

![](figure/tree5-1.png)

### Tree3

``` r
snapalette("Tree3")
```

![](figure/tree3-1.png)

### Charleston

``` r
snapalette("Charleston")
```

![](figure/charleston-1.png)

### SPH building

``` r
snapalette("sph_building")
```

![](figure/sph_building-1.png)

Make your own palette
---------------------

If you have your own holiday snap that would make a great palette, you
can use `snap2palette`. This takes a path to a png or jpeg and produces
a palette from that picture.

``` r
par(mar=c(1,1,1,1))
snap2palette("figure/lemon.jpeg", 5, plot_palette = FALSE, plot_picture = TRUE)
```

![](figure/lemon-1.png)

    #> [1] "#08506c" "#1379a1" "#dfe7e0" "#d0b831" "#dfd46d"

``` r
par(mar=c(1,1,1,1))
snap2palette("figure/lemon.jpeg", 5, plot_palette = TRUE, plot_picture = FALSE)
```

![](figure/lemonpalette-1.png)![](figure/lemonpalette-2.png)

    #> [1] "#157ea5" "#d8c64d" "#084e69" "#10729a" "#dfe6de"
