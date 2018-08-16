#' Count
#'
#' Return counts for a URL.
#'
#' @param url URL to return counts can be \code{list} or \code{vector}.
#' @param check Set to \code{FALSE} to remoe the prompt.
#' @param ... Any other options.
#'
#' @examples
#' \dontrun{sc_count("https://cran.r-project.org/")}
#'
#' @seealso \code{\link{sc_set}} to setup your session.
#'
#' @importFrom utils menu
#'
#' @rdname count
#' @export
sc_count <- function(url, ...){
  if(missing(url))
    stop("must pass ", crayon::red("url"), call. = FALSE)

  .call_api("", opts = list(url = url, ...))
}

#' @rdname count
#' @export
sc_count_n <- function(url, check = interactive(), ...){
  if(missing(url))
    stop("must pass ", crayon::red("url"), call. = FALSE)

  if(isTRUE(check)){
    .run_check(length(url))
  }

  lapply(url, .call_api)
}

#' Bulk
#'
#' Post a large number of URLs all at once to calculate bulk social counts.
#'
#' @param urls List or vector of URLS to process.
#' @param id id of bulk to retrieve, as returned by \code{\link{sc_bulk_p}}.
#' @param force Set this parameter to \code{TRUE} force results to return
#' even if not all URLs have completed processing.
#'
#' @examples
#' \dontrun{
#' urls <- c(
#'   "https://cran.r-project.org/",
#'   "https://www.rstudio.com/"
#' )
#'
#' sc_bulk_p(urls)
#' }
#'
#' @seealso \code{\link{sc_set}} to setup your session.
#'
#' @rdname bulk
#' @export
sc_bulk_p <- function(urls){

  if(missing(urls))
    stop("must pass ", crayon::red("urls"), call. = FALSE)

  if(!is.vector(urls))
    stop("must pass multiple urls as a ", crayon::red("list"), " or ", crayon::red("vector"), call. = FALSE)

  url <- .compose_url("bulk")
  url <- paste0(url, "?apikey=", .get_key())

  response <- httr::POST(url, body = list(urls = paste0(paste0(urls, collapse = "\n"), "\n")))

  httr::content(response)
}

#' @rdname bulk
#' @export
sc_bulk_g <- function(id, force = FALSE){

  if(missing(id))
    stop("must pass ", crayon::red("id"), call. = FALSE)

  .call_api(endpoint = "bulk", list(bulk_id = id, force = as.numeric(force)))
}
