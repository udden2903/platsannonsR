# platsannonsR

The `platsannonsR` package is an R wrapper for the Platsannonser API. More information about the API is available at https://www.arbetsformedlingen.se/Globalmeny/Om-webbplatsen/Oppna-data.html (in Swedish).

## Install

    devtools::install_github("udden2903/platsannonsR")

## Example

    library(platsannonsR)
    data_jobs <- search_jobs("data analyst", limit = 10)
    data_jobs_sthlm <- data_jobs[data_jobs$kommunnamn == "Stockholm",] 
    about_job(data_jobs_sthlm$annonsid[1])
