Holiday snap palettes
=====================

Here are some pallettes I have made from my own holiday snaps. This is based on the excellent wespalette package and is for personal use only.

Installation
------------

``` r
remotes::install_github("mrc-ide/snapalette")
```

Usage
-----

``` r
library("snapalette")
# See all palettes
names(snapalettes)
#>  [1] "Mosaic"          "EspiritoSanta"   "ST_art"         
#>  [4] "DiscoverySuites" "IpanemaSunset"   "Orchid"         
#>  [7] "CaveHouse"       "Kalypso"         "ThiraJazz"      
#> [10] "Camden"          "Venice"          "Barcelona"      
#> [13] "Fjord"           "Stavanger"       "SweetShop"      
#> [16] "Wales"           "SzimplaKert"     "BudapestCitadel"
#> [19] "Ipanema"
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

### Ipanama

``` r
snapalette("Ipanema")
```

![](figure/ipanema-1.png)
