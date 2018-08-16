#' Quota
#'
#' Get information on daily quota allocation, historical usage, and API status.
#'
#' @examples
#' \dontrun{sc_quota()}
#'
#' @seealso \code{\link{sc_set}} to setup your session.
#'
#' @rdname usg
#' @export
sc_quota <- function(){
  .call_api(endpoint = "quota")
}

#' @rdname usg
#' @export
sc_usage <- function(){
  .call_api(endpoint = "usage")
}

#' @rdname usg
#' @export
sc_status <- function(){
  .call_api(endpoint = "status")
}

#' Domain Whitelist
#'
#' Return a list of domains added to your domain whitelist,
#' and whether the domain whitelist is currently being enforced.
#'
#' @examples
#' \dontrun{sc_domains()}
#'
#' @seealso \code{\link{sc_set}} to setup your session.
#'
#' @rdname domain
#' @export
sc_domains <- function(){
  .call_api(endpoint = "domain_whitelist")
}

#' @rdname domain
#' @export
sc_whitelist <- sc_domains
