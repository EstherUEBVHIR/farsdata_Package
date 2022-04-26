#' Title: fars_read_years
#' The function fars_read_years accepts a list of one or more years and calls the function make_filename() with the years. Then, it fills the files with the data of its specific year.
#' Uses make_filename(year)
#'      fars_read(file)
#' @param years (a list with the years we want to obtain the data from). If the year is not valid, an error message will appear.
#' @param year (the year from which we want the data file).
#' @param e (error). 
#' @importFrom dplyr mutate
#' @importFrom dplyr select
#' @return one or more datasets depending on the year/s given. If there is an error it returns NULL.
#' @export fars_read_years
#' @examples
#' \dontrun{fars_read_years(2013)}
#' \dontrun{fars_read_years(as.list(2013, 2015, 2016)))}
#' \dontrun{fars_read_years(2013:2016)}
#'

fars_read_years <- function(years) {
        lapply(years, function(year) {
                file <- make_filename(year)
                tryCatch({
                        dat <- fars_read(file)
                        dplyr::mutate(dat, year = year) %>% 
                                dplyr::select(MONTH, year)
                }, error = function(e) {
                        warning("invalid year: ", year)
                        return(NULL)
                })
        })
}