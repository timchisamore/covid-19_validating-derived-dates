library(targets)
library(tarchetypes)
purrr::walk(.x = fs::dir_ls(path = here::here("R")), .f = source)
tar_option_set(packages = c("tidyverse", "conflicted"))
list(
  tar_file(name = "ccm_case_dates_path", command = here::here("data", "raw", "ccm_case_dates_data.csv")),
  tar_file(name = "ccm_case_symptoms_path", command = here::here("data", "raw", "ccm_case_symptoms_data.csv")),
  tar_file(name = "ccm_case_lab_results_path", command = here::here("data", "raw", "ccm_case_lab_results_data.csv")),
  tar_target(name = "raw_ccm_case_dates_data", command = reading_ccm_case_dates_data(ccm_case_dates_path)),
  tar_target(name = "raw_ccm_case_symptoms_data", command = reading_ccm_case_symptoms_data(ccm_case_symptoms_path)),
  tar_target(name = "raw_ccm_case_lab_results_data", command = reading_ccm_case_lab_results_data(ccm_case_lab_results_path)),
  tar_target(name = "clean_ccm_case_dates_data", command = cleaning_ccm_case_dates_data(raw_ccm_case_dates_data)),
  tar_target(name = "clean_ccm_case_symptoms_data", command = cleaning_ccm_case_symptoms_data(raw_ccm_case_symptoms_data)),
  tar_target(name = "clean_ccm_case_lab_results_data", command = cleaning_ccm_case_lab_results_data(raw_ccm_case_lab_results_data)),
  tar_target(name = "wrong_dates_data", command = creating_wrong_dates_data(clean_ccm_case_dates_data, clean_ccm_case_lab_results_data, clean_ccm_case_symptoms_data)),
  tar_file(name = "write_wrong_dates_data", command = writing_wrong_dates_data(wrong_dates_data))
)
