#' Title: fars_read
#' The function fars_read reads the file used as argument. The input file has to be in csv format and the function returns a dataframe of type tibble.
#' If the file does not exist an error will be printed.
#' @param filename (a csv file)
#' @importFrom readr read_csv
#' @importFrom dplyr tbl_df
#' @return a dplyr tbl_df (a tibble dataframe)
#' @source fars_data/accident_year.csv.bz2
#' @export fars_read
#' @examples
#' \dontrun{x <- fars_read('myFile.csv')}
#' \dontrun{system.file("fars_data", "accident_year.csv.bz2", package = "packFars"). }
#'

fars_read <- function(filename) {
        if(!file.exists(filename))
                stop("file '", filename, "' does not exist")
        data <- suppressMessages({
                readr::read_csv(filename, progress = FALSE)
        })
        dplyr::tbl_df(data)
}

