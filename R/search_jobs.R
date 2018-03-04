#' Query jobs
#' @param query A text query to search
#' @param limit Number of observations to return
#' @example search_jobs("data analyst", limit = 20)
#'
search_jobs <- function(query, limit = 20) {
  request <- httr::GET(
    sprintf(
      "http://api.arbetsformedlingen.se/platsannons/matchning?nyckelord=%s&antalrader=%s",
      URLencode(query), limit
    ),
    add_headers("Content-Type" = "application/json",
                'Accept-Language' = 'se-sv,sv')
  )
  resp_content <- httr::content(request)
  purrr::map_df(1:length(resp_content$matchningslista$matchningdata), function(x)
    data.frame(
      resp_content$matchningslista$matchningdata[[x]],
      stringsAsFactors = F
    )) %>%
    dplyr::mutate_at(vars(publiceraddatum, sista_ansokningsdag), funs(lubridate::ymd(substr(., 1, 10))))
}

