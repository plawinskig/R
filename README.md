# R-1 Project

## Overview

This repository contains an R project with a collection of exercises and scripts organized by level (`L1` through `L7`). It also includes data files used by the scripts.

## Project Structure

- `R_all.Rproj` - RStudio project file
- `L1/` through `L7/` - directories containing R scripts for tasks and exercises
- `bakteria.csv`, `mieszkania.csv`, `waga1.csv` - sample data files
- `pdf/` - PDF resources (if present)

## Requirements

- R installed on your machine
- Recommended: RStudio for interactive use

## Running the Project

### Option 1: Open in RStudio

1. Open `R_all.Rproj` in RStudio.
2. Use the file browser to open any script in `L1/` through `L7/`.
3. Run scripts interactively using the RStudio editor.

### Option 2: Run scripts from the command line

From the project root directory, use `Rscript` to run an R file. For example:

```powershell
Rscript .\L1\zad1.R
```

Adjust the path for the script you want to execute.

## Notes

- Scripts may depend on the CSV files present in the repository root.
- If any script uses packages not installed on your system, install them first using `install.packages("packageName")` in R.
