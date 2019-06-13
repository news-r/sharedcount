#' Setup session
#'
#' Setup your sharedcount session.
#'
#' @param key Your API key.
#' @param quiet Whether to print helpful messages to the console.
#'
#' @examples
#' sc_set("xXXXXXxxxXXxxX")
#'
#' @name set
#' @export
sc_set <- function(key, quiet = !interactive()){

  .Deprecated("sharedcount_key")

  if(missing(key))
    stop("must pass key", call. = FALSE)

  options(
    SHAREDCOUNT_API_KEY = key,
    SHAREDCOUNT_API_QUIET = quiet
  )

  if(!isTRUE(quiet))
    cat(
      crayon::green(cli::symbol$tick),
      "Session",
      crayon::green("successfully"),
      "set up!"
    )

}

#' @rdname set
#' @export
sharedcount_key <- function(key, quiet = !interactive()){

  if(missing(key))
    stop("must pass key", call. = FALSE)

  options(
    SHAREDCOUNT_API_KEY = key,
    SHAREDCOUNT_API_QUIET = quiet
  )

  if(!isTRUE(quiet))
    cat(
      crayon::green(cli::symbol$tick),
      "Session",
      crayon::green("successfully"),
      "set up!"
    )

}
