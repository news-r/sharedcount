#' Setup session
#'
#' Setup your sharedcount session.
#'
#' @param key Your API key.
#' @param quiet Whether to print helpful messages to the console.
#'
#' @examples
#' sharedcount_key("xXXXXXxxxXXxxX")
#'
#' @name set
#' @export
sc_set <- function(key, quiet = !interactive()){

  if(missing(key))
    stop("must pass key", call. = FALSE)

  .Deprecated("sharedcount_key")

  options(
    SHAREDCOUNT_API_KEY = key,
    SHAREDCOUNT_API_QUIET = quiet
  )

  if(!isTRUE(quiet))
    cat(
      crayon::red(cli::symbol$cross),
      "Session is not setup properly"
    )

}

#' @rdname set
#' @export
sharedcount_key <- function(key, quiet = !interactive()){

  if(missing(key))
    stop("must pass key", call. = FALSE)

  Sys.setenv(
    SHAREDCOUNT_API_KEY = key,
    SHAREDCOUNT_API_QUIET = quiet
  )

  if(!isTRUE(quiet))
    cat(
      crayon::green(cli::symbol$tick),
      "Session",
      crayon::green("successfully"),
      "set up!\n"
    )

}
