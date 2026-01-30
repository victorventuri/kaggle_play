# !bin/bash/

########################################################################################################################
##                                                                                                                    ##
##                                          SCRIPT TO LOAD KAGGLE CREDENTIALS                                         ##
##                                                                                                                    ##
########################################################################################################################

# Resolve the directory containing this script (portable across macOS/Linux).
cred_dir="$( dirname -- "${BASH_SOURCE[0]}"; )"  # Get the present directory name
# Prefer `realpath` when available, otherwise fall back to a portable `cd && pwd`.
if command -v realpath >/dev/null 2>&1; then
    cred_dir="$( realpath -- "$cred_dir" )"
else
    cred_dir="$( cd "$cred_dir" >/dev/null 2>&1 && pwd )"
fi
# Add credentials to the path
cred_dir="${cred_dir}/.credentials"

# Check that the file is there
if [ ! -f "${cred_dir}/kaggle.json" ]; then
    echo "Credentials not found: ${cred_dir}/kaggle.json" >&2
    return 1 2>/dev/null || exit 1
fi

# Extract user name from json
KAGGLE_USER=$(jq -r '.username' "${cred_dir}/kaggle.json")
export KAGGLE_USER=$KAGGLE_USER

# Add it to the appropriate environtment variable
export KAGGLE_CONFIG_DIR=$cred_dir

# Activate environment
# NOTE: this requires me to have sourced my own `~/.bash_profile`, which contains the `venv_act` function definition
venv_act kaggle_env

# Source shortcuts
source ./kaggle_shortcuts.sh