shopt -s expand_aliases

export LC_ALL=C.UTF-8
export LANG=C.UTF-8
export CURRENT_VERSION=v4

RUNNER="singularity"

# Load environment
if [ -e env.sh ]; then
  source env.sh
fi

# Create directories
mkdir -p ./datasets ./raw-data ./site
