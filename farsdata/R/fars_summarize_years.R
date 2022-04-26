#' Title: fars_summarize_years
#' The function fars_summarize_years accepts a list of one or more years and passes the list to fars_read_years(). 
#' Then it receives from fars_read_years() a data set in columns month and year, and counts the number of observations for a year by month.
#' Uses fars_read_years(years)
#' @param years (a list with the years we want to obtain the data from).
#' @importFrom dplyr bind_rows
#' @importFrom dplyr group_by
#' @importFrom dplyr summarize
#' @importFrom tidyr spread
#' @return a dataframe with the relative data of the years introduced (counts by month and year).
#' @export fars_summarize_years
#' @examples
#' \dontrun{fars_summarize_years(2013)}
#' \dontrun{fars_summarize_years(as.list(2013, 2015, 2016)))}
#' \dontrun{fars_summarize_years(2013:2016)}
#'

fars_summarize_years <- function(years) {
        dat_list <- fars_read_years(years)
        dplyr::bind_rows(dat_list) %>% 
                dplyr::group_by(year, MONTH) %>% 
                dplyr::summarize(n = n()) %>%
                tidyr::spread(year, n)
}