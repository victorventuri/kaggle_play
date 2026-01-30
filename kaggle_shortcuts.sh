# !bin/bash/

# Define the user (me!)
KAGGLE_USER='vventuri'

# Function to list all notebooks
ls_all_nbs() {
    kaggle kernels list --user "$KAGGLE_USER"
}

