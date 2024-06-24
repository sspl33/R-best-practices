#' Print tree
#' 
#' Public function to print the hierarchical organization of files in a directory.
#'
#' @param start The root directory, by default the working directory.
#' @param n Maximum number of lines to print (by default, 100).
#' @param max_levels Maximum hierarchical level to print (by default, all of them).
#'
#' @return NULL
#' @examples
#' print_tree()
#' print_tree("subdirectory")
print_tree <- function(start = ".", n = 100, max_levels = NULL) {
  if (!file.exists(start)) {
    stop("Please provide a valid path.")
  }
  if (!is.numeric(n)) {
    stop("Please provide a number as `n`.")
  } else if (n < 0) {
    stop("`n` should be a positive number.")
  }
  if (!(is.null(max_levels) || (is.numeric(max_levels) && max_levels > 0))) {
    stop("`max_levels` should be `NULL` or a positive number.")
  }
  print_tree_(start, n, max_levels)
}


#' Private function to be called by `print_tree()`
#'
#' @inheritParams print_tree
#' @param level_ Hierarchical level (starting from 0).
#' @param n_ Number of line to print (starting from 1).
#' @param prefix Characters to print left of the name of the file/directory.
#' @param is_last Whether the current item is the last child of its parent.
print_tree_ <- function(start, n, max_levels, level_ = 0, n_ = 1, prefix = "", is_last = TRUE) {
  if (n_ >= n) {
    return()
  }
  starting_point <- basename(normalizePath(start))
  cat(paste(prefix, starting_point, "\n", sep=""))
  prefix <- gsub(if (is_last) "\\|__$" else "__$", "   ", prefix)
  prefix <- paste(c(prefix, "  |__"), collapse = "")
  if (is.null(max_levels) || level_ < max_levels) {
     files <- list.files(start, full.names = TRUE)
    for (i in seq_along(files)) {
      n_ = n_ + 1
      print_tree_(files[[i]], n = n, max_levels = max_levels, level_ = level_ + 1, n_ = n_, prefix, is_last = i == length(files))
    } 
  }
}
