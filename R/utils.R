# Shared R utilities
safeload <- function(pkgs) {
  to_install <- pkgs[!pkgs %in% rownames(installed.packages())]
  if (length(to_install)) install.packages(to_install, repos = "https://cloud.r-project.org")
  invisible(lapply(pkgs, library, character.only = TRUE))
}
timestamp_path <- function(path) {
  dir.create(dirname(path), showWarnings = FALSE, recursive = TRUE)
  path
}
