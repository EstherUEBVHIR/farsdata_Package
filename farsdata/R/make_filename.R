#' Title: make_filename
#' The function make_filename creates data files by year in bz2 format. It transforms the argument year into an interger and sends the determined name of the file to a string.
#' @param year (the year from which we want the data file).
#' @return a filename of the kind 'accident_year.csv.bz2'.
#' @export make_filename
#' @examples
#' \dontrun{x <- make_filename("2013")}
#' \dontrun{system.file("fars_data", "accident_year.csv.bz2", package = "packFars")}
#'

make_filename <- function(year) {
        year <- as.integer(year)
        sprintf("accident_%d.csv.bz2", year)
}
