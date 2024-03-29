``` r
library(readr)
filename <- "nonexistentpath"
read_delim(filename)
#> Error: 'nonexistentpath' does not exist in current working directory ('C:/Users/u0118974/repos/github/hpcleuven/R-best-practices/R').
```

<sup>Created on 2024-03-29 with [reprex v2.1.0](https://reprex.tidyverse.org)</sup>
