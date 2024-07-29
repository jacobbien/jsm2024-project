# jsm2024-project

This R package is created using literate programming with the  [litr](https://github.com/jacobbien/litr-project/tree/main/litr) R package.  Please see [jsm2024](jsm2024) for the generated R package itself.

## Code for generating the `jsm2024` package

After cloning this repo...

```r
remotes::install_github("jacobbien/litr-project", subdir = "litr")
litr::render("create-jsm2024.Rmd")
fs::file_move("create-jsm2024.html", "docs/")
```

This will create [create-jsm2024.html](https://jacobbien.github.io/jsm2024-project/create-jsm2024.html) and the package directory [jsm2024](jsm2024).  The last line moves the .html file to a location where github will render it more nicely.