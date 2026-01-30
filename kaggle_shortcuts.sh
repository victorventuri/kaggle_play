# !bin/bash/

# Kaggle shortcuts: locate credentials and expose helper functions.

# Resolve the directory containing this script (portable across macOS/Linux).
cred_dir="$( dirname -- "${BASH_SOURCE[0]}"; )"  # Get the directory name
cred_dir="$( realpath -- "$cred_dir"; )"  # Resolve its full path if need be
# cred_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Credentials directory under the script directory
cred_dir="${cred_dir}/.credentials"

if [ ! -f "${cred_dir}/kaggle.json" ]; then
    echo "Credentials not found: ${cred_dir}/kaggle.json" >&2
    return 1 2>/dev/null || exit 1
fi

# Extract user name from json
KAGGLE_USER=$(jq -r '.username' "${cred_dir}/kaggle.json")

# Function to list all notebooks
ls_all_nbs() {
    kaggle kernels list --user "$KAGGLE_USER"
}
