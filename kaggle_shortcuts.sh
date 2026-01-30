# !bin/bash/

# Kaggle shortcuts: locate credentials and expose helper functions.

# Function to list all notebooks
ls_all_nbs() {
    kaggle kernels list --user "$KAGGLE_USER"
}
