#' Title: fars_map_state
#' The function fars_map_state accepts a state number and a year as arguments. With make_filename function it creates the filename and with fars_read it obtains the corresponding data frame.
#' It gives an error if the state number does not exist. Otherwise it creates plots based on latitude and longitude, using maps and graphics.
#' Uses make_filename(year)
#'      fars_read(filename)
#' @param state.num (state number)
#' @param year (the year from which we want the data file)
#' @importFrom dplyr filter
#' @importFrom maps map
#' @importFrom graphics points
#' @return a dataframe with the longitud and the latitud of the introduced state and year.
#' @export fars_map_state
#' @examples
#' \dontrun{fars_map_state(3,2013)}
#'


fars_map_state <- function(state.num, year) {
        filename <- make_filename(year)
        data <- fars_read(filename)
        state.num <- as.integer(state.num)

        if(!(state.num %in% unique(data$STATE)))
                stop("invalid STATE number: ", state.num)
        data.sub <- dplyr::filter(data, STATE == state.num)
        if(nrow(data.sub) == 0L) {
                message("no accidents to plot")
                return(invisible(NULL))
        }
        is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 900
        is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
        with(data.sub, {
                maps::map("state", ylim = range(LATITUDE, na.rm = TRUE),
                          xlim = range(LONGITUD, na.rm = TRUE))
                graphics::points(LONGITUD, LATITUDE, pch = 46)
        })
}