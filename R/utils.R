.get_base_url <- function(){
  getOption("SHAREDCOUNT_API_BASE_URL")
}

.get_key <- function(){
  K <- getOption("SHAREDCOUNT_API_KEY")

  if(is.null(K))
    stop("missing key, see ", crayon::blue("sc_key"), call. = FALSE)

  return(K)
}

.get_quiet <- function(){
  K <- getOption("SHAREDCOUNT_API_KEY")

  if(is.null(K))
    stop("missing key, see ", crayon::blue("sc_key"), call. = FALSE)

  return(K)
}

.compose_url <- function(endpoint){
  base_url <- .get_base_url()
  paste0(base_url, endpoint)
}

.call_api <- function(endpoint = "", opts = list()){

  # add key
  K <- .get_key()
  opts <- append(opts, list(apikey = K))

  # build
  url <- .compose_url(endpoint)
  parsed <- httr::parse_url(url)
  parsed$scheme <- "https"
  parsed$query <- opts

  # call
  built <- httr::build_url(parsed)
  response <- tryCatch(httr::GET(built), error = function() NULL)
  if(is.null(response) && !isTRUE(.get_quiet()))
    warning("API call ", crayon::red("error"), ", response is NULL.")
  httr::content(response)
}

.run_check <- function(n){
  msg <- paste("You are about to use", crayon::red(n), "API calls.\n",
      "Are you sure you want to proceed? (yes/no)")
   x <- menu(c("Yes", "No"), graphics = FALSE, title = msg)

  if(x == 2)
    stop(crayon::red("Not"), " calling API.", call. = FALSE)
}
