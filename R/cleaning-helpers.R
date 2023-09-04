# localize_beach() --------------------------------------------------------
#' localize beach
#'
#' @param dat Input data frame
#'
#' @return A double vector
#' @export
#'
#' @examples
#' dat <- dplyr::tribble(
#' ~name, ~where, ~temp,
#' "Adam", "beach", 95,
#' "Bess", "coast", 91,
#' "Cora", "seashore", 28,
#' "Dale", "beach", 85,
#' "Evan", "seaside", 31)
#' localize_beach(dat)
localize_beach <- function(dat){
  lookup_table <- dplyr::tribble(
    ~where, ~english,
    "beach", "US",
    "coast", "US",
    "seashore", "UK",
    "seaside", "UK"
  )
  dplyr::left_join(dat, lookup_table)
}

# celsify_temp() ----------------------------------------------------------
#' Convert to Celsius
#'
#' @param dat Input data frame
#'
#' @return A double vector
#' @export
#'
#' @examples
#' dat <- dplyr::tribble(
#' ~name, ~where, ~temp,
#' "Adam", "beach", 95,
#' "Bess", "coast", 91,
#' "Cora", "seashore", 28,
#' "Dale", "beach", 85,
#' "Evan", "seaside", 31)
#' dat <- localize_beach(dat)
#' celsify_temp(dat)
celsify_temp <- function(dat){
  dplyr::mutate(dat, temp = dplyr::if_else(english == "US", f_to_c(temp), temp))
}

# outfile_path() ----------------------------------------------------------
#' Outfile Path
#'
#' @param infile input file name
#' @param time use can provide a time, but "now is the default.
#'
#' @return A character vector
#' @export
#'
#' @examples
#' infile <- "raw.csv"
#' outfile_path(infile)
outfile_path <- function(infile, time = Sys.time()) {
  ts <- timestamp(time)
  paste0(ts, "_", sub("(.*)([.]csv$)", "\\1_clean\\2", infile))
}
