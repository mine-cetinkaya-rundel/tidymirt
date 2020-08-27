combine_test_versions <- function(test_a, test_b, meta_data){

  response_data = tibble::tibble(
    A1_B1 = runif(10) %>% round(),
    A2_B3 = runif(10) %>% round(),
    A3_B0 = runif(10) %>% round(),
    A4_B2 = runif(10) %>% round(),
    A0_B4 = runif(10) %>% round()
  )

  meta_data = tibble::tibble(
    label       = c("A1_B1", "A2_B3", "A3_B0", "A4_B2", "A0_B4"),
    id          = rep(NA, 5),
    group       = rep(NA, 5),
    A           = c(1, 2, 3, 4, 0),
    B           = c(1, 3, 0, 2, 4),
    test_a_name = c("A1", "A2", "A3", "A4", "A0"),
    test_b_name = c("B1", "B2", "B0", "B2", "B4"),
    status      = c("unchanged", "moved", "removed", "moved", "added")
  )

  return(
    list(
      response_data = response_data,
      meta_data     = meta_data
    )
  )

}
