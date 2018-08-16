# sharedcount

R wrapper to the [SharedCount](https://www.sharedcount.com) API.

## Installation

``` r
# install.packages("devtools")
devtools::install_github("JohnCoene/sharedcount")
```
## Functions

- `sc_set` - Setup your session.
- `sc_status` - Check API status.
- `sc_quota` - Check quota allocation.
- `sc_usage` - Check historical usage.
- `sc_domains` and `sc_whitelist` - Retrieve whitelisted domains.
- `sc_count` - Get share count of URL.
- `sc_bulk_p` and `sc_bulk_g` - POST bulk URLs and GET their counts.

## Example

All functions start with `sc_`, setup your session with `sc_set`.

``` r
sc_set("xxXXxxXxxXXxX")

sc_count("https://cran.r-project.org/")
```
