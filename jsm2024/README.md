
# Navigate the JSM schedule from the comfort of an R console <img src="man/figures/logo.png" align="right" height="50px;" />

<!-- badges: start -->
<!-- badges: end -->

`jsm2024` is an R package with all the JSM talks. It makes personalized
recommendations for talks (based on citation network data) and exports
your schedule as an ical file that can be loaded into Google Calendar
and similar.

### Getting started

To install the package:

``` r
remotes::install_github("jacobbien/jsm2024-project", subdir = "jsm2024")
```

An example of the sort of thing you can do with the package:

``` r
# which of my co-authors are at JSM?
my_coauthors <- jsm2024::get_coauthors("Jacob Bien")

# which of the people I cite the most are at JSM?
people_cited_by_me <- jsm2024::get_out_citations("Jacob Bien")

# which of the people who cite me the most are at JSM?
people_citing_me <- jsm2024::get_in_citations("Jacob Bien")

# when are their talks?
schedule <- jsm2024::get_talks(
  speakers = c(my_coauthors, people_cited_by_me[1:8], people_citing_me[1:8]),
  session_types = "Paper",
  days = c("2024-08-05", "2024-08-06", "2024-08-07")
)
```

This produces a data frame of talks:

``` r
dplyr::select(schedule, speaker, title)
#> # A tibble: 11 × 2
#>    speaker                             title                                    
#>    <chr>                               <glue>                                   
#>  1 Jacob Bien, Anna Neufeld, Lihua Lei [Discussion] 'JASA Theory and Methods In…
#>  2 Irina Gaynanova                     Hierarchical Nuclear Norm Penalization f…
#>  3 Ryan Tibshirani                     Opportunities and Challenges in Auxiliar…
#>  4 Robert Tibshirani                   Cooperative learning and cooperative com…
#>  5 Anna Neufeld                        Data thinning to avoid double dipping, w…
#>  6 Evan Ray                            Flusion: Integrating Multiple Data Sourc…
#>  7 Aditya Mishra                       TARO: Tree aggregated factor regression …
#>  8 Luo Xiao                            Functional Data Methods with Informative…
#>  9 Sumanta Basu                        Impulse Response Estimation in Large-sca…
#> 10 Ali Shojaie                         Nonparametric Sequential Change-point De…
#> 11 Robert Tibshirani                   Pre-training and the Lasso
```

See `?get_talks` for the other ways you can filter talks. Finally, you
can export this in the ical format, which can be imported into Google
Calendar and other standard calendars:

``` r
jsm2024::export_calendar_to_ics(schedule, file = "jsm-talks.ics")
```

Once imported into Google Calendar, we get the following:

<img src="man/figures/ics-imported.png" />

### About

[We](http://faculty.marshall.usc.edu/jacob-bien/) wrangled decades of
citation and coauthorship data from Semantic Scholar and arxiv to form
these recommendations. Special thanks to [Donna
LaLonde](https://www.linkedin.com/in/donna-lalonde-she-her-a6a41124) and
[Ronald
Wasserstein](https://www.amstat.org/about-asa/ronald-l-wasserstein) this
year for providing JSM program information. We have also included
functionality for exporting your schedule as an ical that can be loaded
into Google Calendar or similar. The result is a package that
streamlines the process of finding talks that you may want to attend.
The first version of this was done as a web app for JSM 2019 with [Ronak
Upadhyaya](https://ronakupadhyaya.github.io/) and the [second
version](https://github.com/jacobbien/jsm2022-project/tree/main/jsm2022),
for JSM 2022, was done with [Yibin
Xiong](https://www.linkedin.com/in/yibin-xiong-936b64204/). `jsm2024`
was written using literate programming. In particular, the entire
package was generated by “litr-knitting” [a single Rmd
file](https://jacobbien.github.io/jsm2024-project/create-jsm2024.html).
To learn more about the `litr` package and the literate programming
approach to writing R packages, see
[here](https://jacobbien.github.io/litr-project/).

### Citation and coauthor data acknowledgments

The citation data came from [Semantic Scholar’s
API](https://api.semanticscholar.org/datasets/v1/release/latest) and is
associated with the following paper:

> Waleed Ammar, Dirk Groeneveld, Chandra Bhagavatula, Iz Beltagy, Miles
> Crawford, Doug Downey, Jason Dunkelberger, Ahmed Elgohary, Sergey
> Feldman, Vu A. Ha, Rodney Michael Kinney, Sebastian Kohlmeier, Kyle
> Lo, Tyler C. Murray, Hsu-Han Ooi, Matthew E. Peters, Joanna L. Power,
> Sam Skjonsberg, Lucy Lu Wang, Christopher Wilhelm, Zheng Yuan,
> Madeleine van Zuylen, Oren Etzioni, *Construction of the Literature
> Graph in Semantic Scholar*. NAACL 2018.

Coauthorship data came also from [arxiv
metadata](https://arxiv.org/help/oa/index).