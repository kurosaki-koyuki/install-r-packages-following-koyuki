cat("=====================================\n")
cat("  STEP 1: Install Core tidyverse\n")
cat("=====================================\n\n")

cran_repo <- "https://cloud.r-project.org/"

install_pkg <- function(pkg_name, repo = cran_repo) {
  cat(sprintf("  %s... ", pkg_name))
  
  if (pkg_name %in% installed.packages()[, "Package"]) {
    cat("already installed\n")
    return(TRUE)
  }
  
  tryCatch({
    install.packages(pkg_name, repos = repo, dependencies = TRUE, type = "binary", quiet = TRUE)
    if (pkg_name %in% installed.packages()[, "Package"]) {
      cat("success\n")
      return(TRUE)
    }
  }, error = function(e) {})
  
  tryCatch({
    install.packages(pkg_name, repos = repo, dependencies = TRUE, quiet = TRUE)
    if (pkg_name %in% installed.packages()[, "Package"]) {
      cat("success\n")
      return(TRUE)
    }
  }, error = function(e) {})
  
  cat("failed\n")
  return(FALSE)
}

cat("Installing core tidyverse packages...\n")
install_pkg("tidyverse")
install_pkg("data.table")

cat("\n")
cat("=====================================\n")
cat("  STEP 2: Install ggplot2 and Extensions\n")
cat("=====================================\n")

cat("Installing ggplot2 core and related packages...\n")
install_pkg("ggplot2")
install_pkg("ggpubr")
install_pkg("ggthemes")
install_pkg("ggsci")
install_pkg("ggrepel")
install_pkg("ggridges")
install_pkg("ggExtra")
install_pkg("ggforce")
install_pkg("ggsignif")
install_pkg("ggalluvial")
install_pkg("ggcorrplot")
install_pkg("ggdendro")
install_pkg("ggfortify")
install_pkg("ggnetwork")
install_pkg("ggpointdensity")
install_pkg("ggprism")

cat("\n")
cat("=====================================\n")
cat("  STEP 3: Install Visualization Packages\n")
cat("=====================================\n")

cat("Installing additional visualization packages...\n")
install_pkg("plotly")
install_pkg("heatmaply")
install_pkg("pheatmap")
install_pkg("corrplot")
install_pkg("RColorBrewer")
install_pkg("viridis")
install_pkg("scales")
install_pkg("gridExtra")
install_pkg("cowplot")
install_pkg("patchwork")
install_pkg("ggsankey")

cat("\n")
cat("=====================================\n")
cat("  STEP 4: Install Data Processing Packages\n")
cat("=====================================\n")

cat("Installing data processing and manipulation packages...\n")
install_pkg("dplyr")
install_pkg("tidyr")
install_pkg("readr")
install_pkg("purrr")
install_pkg("tibble")
install_pkg("stringr")
install_pkg("lubridate")
install_pkg("forcats")
install_pkg("janitor")
install_pkg("skimr")
install_pkg("tidycensus")

cat("\n")
cat("=====================================\n")
cat("  STEP 5: Install Statistical Packages\n")
cat("=====================================\n")

cat("Installing statistical analysis packages...\n")
install_pkg("broom")
install_pkg("car")
install_pkg("lme4")
install_pkg("lmerTest")
install_pkg("emmeans")
install_pkg("multcomp")
install_pkg("pwr")
install_pkg("psych")
install_pkg("factoextra")
install_pkg("cluster")

cat("\n")
cat("=====================================\n")
cat("  STEP 6: Install Utility Packages\n")
cat("=====================================\n")

cat("Installing utility and helper packages...\n")
install_pkg("here")
install_pkg("glue")
install_pkg("magrittr")
install_pkg("conflicted")
install_pkg("knitr")
install_pkg("rmarkdown")
install_pkg("tinytex")
install_pkg("openxlsx")
install_pkg("writexl")
install_pkg("readxl")
install_pkg("haven")
install_pkg("jsonlite")
install_pkg("xml2")
install_pkg("rvest")

cat("\n")
cat("=====================================\n")
cat("  STEP 7: Load Test\n")
cat("=====================================\n")

test_pkgs <- c(
  "tidyverse", "ggplot2", "ggpubr", "ggthemes", "ggsci",
  "ggrepel", "patchwork", "cowplot", "plotly", "pheatmap",
  "dplyr", "tidyr", "readr", "lubridate", "broom", "here",
  "glue", "knitr", "rmarkdown", "openxlsx", "readxl"
)
test_pkgs <- test_pkgs[test_pkgs %in% installed.packages()[, "Package"]]

for (pkg in test_pkgs) {
  cat(sprintf("  library(%s)... ", pkg))
  tryCatch({
    suppressWarnings(library(pkg, character.only = TRUE, quietly = TRUE))
    cat("success\n")
  }, error = function(e) {
    cat(sprintf("failed: %s\n", substr(conditionMessage(e), 1, 50)))
  })
}

cat("\n")
cat("=====================================\n")
cat("  INSTALLATION COMPLETE\n")
cat("=====================================\n")
cat("\nIf any packages failed to install, you can manually install them:\n")
cat("  install.packages('package_name', repos = 'https://cloud.r-project.org/')\n")