# !bin/bash/

# Get present directory
dir="$( dirname -- "${BASH_SOURCE[0]}"; )";   # Get the directory name
dir="$( realpath -- "$dir"; )";    # Resolve its full path if need be
# Add credentials to the path
dir="${dir}/.credentials"

# Add it to the appropriate environtment variable
export KAGGLE_CONFIG_DIR=$dir