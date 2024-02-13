# R Best Practices

## About
This repository offers the training material for the VSC course "R Best Practices".

## Content

Some ideas/resources (by Mariana):
- The [tidyverse styleguide](https://style.tidyverse.org/index.html) -- at least the "Analyses" part. Note: it's a bit old (about 5 years) so it does not mention R 4's native pipe.
- Jennifer Bryan and others are also working on [What They Forgot to Teach You About R](https://rstats.wtf/).
- Project oriented workflow: particularly easy with the RStudio IDE and the [`{here}`](https://here.r-lib.org/index.html) package.
    + I just learned that underlying `{here}` is the [`{rprojroot}`](chrome-extension://efaidnbmnnnibpcajpcglclefindmkaj/https://cran.r-project.org/web/packages/rprojroot/rprojroot.pdf) package, which can define the root of a project based on files other than the ".Rproj" file from RStudio projects. These include [Quarto](https://quarto.org), Git and Renv projects (see below), so this is valid without the IDE too.
- Use a virtual environment with, for example, [`{renv}`](https://rstudio.github.io/renv/) (I must say that I've had mixed experiences here, but it is still important).
- Thinking about interactive code on the console, R scripts and literate programming (when to use what). Some R+Python based ideas can be found in [Yihui Xie's post](https://yihui.org/en/2018/09/notebook-war/).
- Use the [pipe](https://www.r-bloggers.com/2021/05/the-new-r-pipe/) (either native or `{magrittr}`'s?)
- Create [reproducible examples](https://reprex.tidyverse.org/) for debugging, creating issues...
- I/O considerations: how to properly read/write files (CSV, TSV, etc)
- how to distribute projects (incl. data and scripts) 
    + using git (via IDE)
    + using relative paths w.r.t. top-level project path
    + See [MCLM 2022 cheatsheet](https://mclm2022.github.io/git/cheatsheet.html)
- GJBex material about [Best Practices in Programming](https://gjbex.github.io/Best-practices-in-programming/)
- Using linters and styler?
