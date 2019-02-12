Summary of session 1
================

We started by opening Rstudio and taking a look around. [This YouTube
video does something similar]().

# Workflow basics

We created a new, empty folder on our desktop to work in.

We then created an Rproject in that folder by doing the following:

  - Clicking the icon in the top right of Rstudio
  - Selecting new project
  - Selecting from existing directory
  - Then selecting the empty folder on our desktop

We then navigated to that folder and noticed there was a new .Rproj file
in that folder.

By opening up that .Rproj file you start an R session in that folder.

# Objects and assignment

We first talked about assignment and the idea of objects in R. This is a
big difference between R and Stata — in Stata you have one main dataset
that you always work, in R you can have as many objects as you want.

This create an object named “x” in R that holds the value 2:

``` r
x <- 2
```

This is another way of creating the same object:

``` r
x = 2
```

You can also do this, but it isn’t a good idea:

``` r
2 -> x
```

You can see what objects you have by looking at the environment tab.

# Intro to the pipe %\>%

We loaded the tidyverse package that everyone installed before class:

``` r
library(tidyverse)
```

    ## ── Attaching packages ──────────────────

    ## ✔ ggplot2 3.1.0     ✔ purrr   0.3.0
    ## ✔ tibble  2.0.1     ✔ dplyr   0.7.8
    ## ✔ tidyr   0.8.2     ✔ stringr 1.3.1
    ## ✔ readr   1.3.1     ✔ forcats 0.3.0

    ## ── Conflicts ── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

We noticed that these two lines of code both do the same thing:

``` r
median(mean(1:10))
```

    ## [1] 5.5

``` r
1:10 %>% mean() %>% median()
```

    ## [1] 5.5

The first line of code you read from the inside out. The second line of
code you read from left to right, which many people find more natural.

# Working with a simple data set

We downloaded a simple hamsters data set by going
[here](https://raw.githubusercontent.com/stenhaug/stanfordsoc382/master/data-raw/hamsters.csv)
and right clicking, then choosing save as to the folder we’re working
in.

We then read in the data and looked at it:

``` r
hamsters = read_csv("data-raw/hamsters.csv")
```

    ## Parsed with column specification:
    ## cols(
    ##   name = col_character(),
    ##   lives = col_character(),
    ##   hamsters = col_double(),
    ##   hamster_cages = col_double()
    ## )

``` r
hamsters
```

    ## # A tibble: 6 x 4
    ##   name   lives hamsters hamster_cages
    ##   <chr>  <chr>    <dbl>         <dbl>
    ## 1 Megan  urban        5             2
    ## 2 Amy    rural        7             1
    ## 3 Jen    urban        6             3
    ## 4 Karl   rural        2             3
    ## 5 Jeremy urban        1             4
    ## 6 Amy    urban        3             2

Next we filtered to only look at Amy’s:

``` r
filter(hamsters, name == "Amy")
```

    ## # A tibble: 2 x 4
    ##   name  lives hamsters hamster_cages
    ##   <chr> <chr>    <dbl>         <dbl>
    ## 1 Amy   rural        7             1
    ## 2 Amy   urban        3             2

We noticed that running that function didn’t change hamsters, it just
run the function and printed to the screen.

If we we wanted to save the results, we could do something like this:

``` r
hamsters_only_amy = filter(hamsters, name == "Amy")

hamsters_only_amy
```

    ## # A tibble: 2 x 4
    ##   name  lives hamsters hamster_cages
    ##   <chr> <chr>    <dbl>         <dbl>
    ## 1 Amy   rural        7             1
    ## 2 Amy   urban        3             2

We noticed the equivalence between the following two lines of code:

``` r
filter(hamsters, name == "Amy")
```

    ## # A tibble: 2 x 4
    ##   name  lives hamsters hamster_cages
    ##   <chr> <chr>    <dbl>         <dbl>
    ## 1 Amy   rural        7             1
    ## 2 Amy   urban        3             2

``` r
hamsters %>% filter(name == "Amy")
```

    ## # A tibble: 2 x 4
    ##   name  lives hamsters hamster_cages
    ##   <chr> <chr>    <dbl>         <dbl>
    ## 1 Amy   rural        7             1
    ## 2 Amy   urban        3             2

We used the `select` function to remove the hamster\_cages column:

``` r
select(hamsters_only_amy, -hamster_cages)
```

    ## # A tibble: 2 x 3
    ##   name  lives hamsters
    ##   <chr> <chr>    <dbl>
    ## 1 Amy   rural        7
    ## 2 Amy   urban        3

We closed by comparing the two ways of filtering to only look at Amy and
then removing the hamster\_cages column:

``` r
# read left to right
hamsters %>% 
    filter(name == "Amy") %>% 
    select(-hamster_cages)
```

    ## # A tibble: 2 x 3
    ##   name  lives hamsters
    ##   <chr> <chr>    <dbl>
    ## 1 Amy   rural        7
    ## 2 Amy   urban        3

``` r
# read inside out
select(filter(hamsters, name == "Amy"), -hamster_cages)
```

    ## # A tibble: 2 x 3
    ##   name  lives hamsters
    ##   <chr> <chr>    <dbl>
    ## 1 Amy   rural        7
    ## 2 Amy   urban        3
