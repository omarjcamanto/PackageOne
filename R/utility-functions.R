
utils::globalVariables(c("english", "temp"))

#' F to C converter
#'
#' @param x double vector
#'
#' @return double vector
f_to_c <- function(x) {
  (x - 32) * 5/9
  }

#' Timestamp
#'
#' @param time time according to system.
#'
#' @return character vector
timestamp <- function(time = Sys.time()) {
  withr::local_locale(c("LC_TIME" = "C"))
  withr::local_timezone("UTC")
  format(time, "%Y-%B-%d_%H-%M-%S")
}
