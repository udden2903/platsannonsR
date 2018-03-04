#' Query a particular job id
#' @param id A job id (annonsid)
#'
about_job <- function(id) {
  request <- httr::GET(
    sprintf(
      "http://api.arbetsformedlingen.se/platsannons/%s", as.character(id)),
    add_headers("Content-Type" = "application/json",
                'Accept-Language' = 'se-sv,sv')
  )
  resp_content <- httr::content(request)
  #Remove named lists because of bug in map_dfc
  purrr::map_dfc(1:length(resp_content[[1]]), function(x) resp_content[[1]][[x]][!sapply(resp_content[[1]][[x]], is.list)])
}

