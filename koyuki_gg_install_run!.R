#========================================#
#   Koyuki GG & Tidyverse Installation Runner
#========================================#
#
# This script runs the GG/tidyverse installation
# Works with source() or Run button in RStudio
#
# Usage:
#   source("koyuki_gg_install_run!.R")
#

cat("========================================\n")
cat("   Koyuki GG & Tidyverse Installation\n")
cat("========================================\n\n")

find_installer <- function() {
  possible_paths <- c()
  
  args <- commandArgs(trailingOnly = FALSE)
  for (arg in args) {
    if (grepl("--file=", arg)) {
      script_path <- normalizePath(sub("--file=", "", arg))
      possible_paths <- c(possible_paths, file.path(dirname(script_path), "gg_install_by_koyuki", "install_gg.R"))
    }
  }
  
  if (requireNamespace("rstudioapi", quietly = TRUE)) {
    tryCatch({
      doc_path <- rstudioapi::getSourceEditorContext()$path
      if (!is.null(doc_path)) {
        possible_paths <- c(possible_paths, file.path(dirname(doc_path), "gg_install_by_koyuki", "install_gg.R"))
      }
    }, error = function(e) {})
  }
  
  possible_paths <- c(possible_paths, 
                      file.path(getwd(), "gg_install_by_koyuki", "install_gg.R"),
                      "gg_install_by_koyuki/install_gg.R")
  
  for (path in possible_paths) {
    if (file.exists(path)) {
      return(normalizePath(path))
    }
  }
  
  return(NULL)
}

installer_path <- find_installer()

if (is.null(installer_path)) {
  cat("ERROR: Installation script not found\n")
  cat("Looking for: gg_install_by_koyuki/install_gg.R\n\n")
  cat("Possible solutions:\n")
  cat("  1. Set working directory to where this script is located:\n")
  cat("     setwd('path/to/script/directory')\n")
  cat("  2. Or directly run the installer:\n")
  cat("     source('gg_install_by_koyuki/install_gg.R')\n")
  stop("Installation script not found")
}

cat("Found installer at:", installer_path, "\n\n")
cat("Running installation...\n\n")
source(installer_path)