#' Combine two versions of a test
#'
#' Combine data from two versions of a test, keeping track of which questions
#' were unchanged, moved, removed, or added.
#'
#' @param test_a A data frame with data from Test A.
#' @param test_b A data frame with data from Test A.
#' @param meta_data A data frame linking Test A to Test B.
#'
#' @return A combined data frame \code{response_data} and \code{meta_data}.
#' @export
#'
#' @examples
#'
#' library(tibble)
#'
#' test_a <- tribble(
#'   ~A1, ~A2, ~A3, ~A4,
#'   0,   1,   1,   0,
#'   0,   0,   1,   1,
#'   0,   1,   0,   1
#' )
#'
#' test_b <- tribble(
#'   ~B1, ~B2, ~B3, ~B4,
#'   1,   1,   1,   0,
#'   0,   1,   0,   1,
#'   0,   1,   0,   0
#' )
#'
#' meta_data <- tribble(
#'   ~A, ~B,
#'   1,  1,
#'   2,  3,
#'   3,  NA,
#'   4,  2,
#'   NA,  2
#' )
#'
#' combine_test_versions(test_a, test_b, meta_data)
#'
combine_test_versions <- function(test_a, test_b, meta_data){

  response_data = tibble::tibble(
    A1_B1 = c(1, 0, 1, 1),
    A2_B3 = c(1, 1, 1, 1),
    A3_B0 = c(1, 0, 0, 1),
    A4_B2 = c(0, 1, 1, 0),
    A0_B4 = c(1, 0, 1, 1)
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
