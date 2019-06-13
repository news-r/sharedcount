![](https://www.sharedcount.com/sharedcount.svg)

R wrapper to the [SharedCount](https://www.sharedcount.com) API.

## Installation

``` r
# install.packages("devtools")
devtools::install_github("JohnCoene/sharedcount")
```
## Functions

Functions that directly call API:

- `sc_set` - Setup your session.
- `sc_status` - Check API status.
- `sc_quota` - Check quota allocation.
- `sc_usage` - Check historical usage.
- `sc_domains` and `sc_whitelist` - Retrieve whitelisted domains.
- `sc_count` - Get share count of URL.
- `sc_bulk_p` and `sc_bulk_g` - POST bulk URLs and GET their counts.

Convenience funtions:

Since bulk requests (`sc_bulk_p` and `sc_bulk_g`) are not part of the free plan, there is a convience functions for free users to call multiple urls in one function _but multiple calls_.

- `sc_count_n`

## Example

All functions start with `sc_`, at the exception of the one to setup your session `sharedcount_key`.

``` r
sharedcount_key(key = "xxXXxxXxxXXxX")

sc_count("https://cran.r-project.org/")
```
