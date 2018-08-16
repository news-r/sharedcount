.onAttach <- function(libname, pkgname) {
  options(SHAREDCOUNT_API_BASE_URL = "https://api.sharedcount.com/v1.0/")
}

.onLoad <- function(libname, pkgname) {
  options(SHAREDCOUNT_API_BASE_URL = "https://api.sharedcount.com/v1.0/")
}
