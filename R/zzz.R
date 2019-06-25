.onAttach <- function(libname, pkgname) {
  options(SHAREDCOUNT_API_BASE_URL = "https://api.sharedcount.com/v1.0/")

  key <- Sys.getenv("SHAREDCOUNT_API_KEY")

  msg <- "No API key found, see `sharedcount_key`"
  if(nchar(key) > 1) msg <- "API key loaded!"

  packageStartupMessage(msg)
}

.onLoad <- function(libname, pkgname) {
  options(SHAREDCOUNT_API_BASE_URL = "https://api.sharedcount.com/v1.0/")
}
