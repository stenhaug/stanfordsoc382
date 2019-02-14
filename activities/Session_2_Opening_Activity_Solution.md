Session 2 Opening Activity Solution
================

First be sure to load the tidyverse packages.

``` r
library(tidyverse)
```

1.  Load the data

<!-- end list -->

``` r
hamsters <- read_csv(here::here("data-raw", "hamsters.csv"))
```

    ## Parsed with column specification:
    ## cols(
    ##   name = col_character(),
    ##   lives = col_character(),
    ##   hamsters = col_double(),
    ##   hamster_cages = col_double()
    ## )

2.  Create hamsters\_many

<!-- end list -->

``` r
hamsters_many <- filter(hamsters, hamsters >= 5)
```

3.  Create hamsters\_many\_cages

<!-- end list -->

``` r
hamsters_many_cages <- filter(hamsters, hamster_cages >= 3)
```

4.  Bind rows

<!-- end list -->

``` r
many <- bind_rows(hamsters_many, hamsters_many_cages)
```

5.  The code stacked the two data frames hamsters\_many and
    hamsters\_many\_cages on top of each other

6.  Arrange

<!-- end list -->

``` r
arrange(many, hamsters, hamster_cages)
```

    ## # A tibble: 6 x 4
    ##   name   lives hamsters hamster_cages
    ##   <chr>  <chr>    <dbl>         <dbl>
    ## 1 Jeremy urban        1             4
    ## 2 Karl   rural        2             3
    ## 3 Megan  urban        5             2
    ## 4 Jen    urban        6             3
    ## 5 Jen    urban        6             3
    ## 6 Amy    rural        7             1

7.  The code sorted the many data frame

8-11. save.image() saves all objects in the workspace. write\_rds()
saves a single object. The error was because we didn’t have a data-clean
folder.
