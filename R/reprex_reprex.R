#' ---
#' output: reprex::reprex_document
#' ---

library(readr)
filename <- "nonexistentpath"
read_delim(filename)
