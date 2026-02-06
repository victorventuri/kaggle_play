# !bin/bash/

# Kaggle shortcuts: locate credentials and expose helper functions.

# Function to list all notebooks
ls_all_nbs() {
    kaggle kernels list --user "$KAGGLE_USER"
}

# Function to initialize a kernel 
kernel_init() {
    # Get location (default to where the function was called from)
    local location="${1:-$PWD}"

    # Get the full path
    # Prefer `realpath` when available, otherwise fall back to a portable `cd && pwd`.
    if command -v realpath >/dev/null 2>&1; then
        location="$( realpath -- "$location" )"
    else
        location="$( cd "$location" >/dev/null 2>&1 && pwd )"
    fi

    # Print so the user knows
    echo "Initializing kernel in $location"

    # Initialize kernel
    kaggle kernels init -p $location
}
