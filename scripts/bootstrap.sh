#!/bin/bash
#
# ------- bootstrap.sh
# This script bootstraps the project and all its dependencies, including:
# Sail, NPM, databases and other external services.
#
# You can use it to initialize, reboot or otherwise restart the stack.
# -------

# Set sail path to variable
sail=vendor/bin/sail

# Determine which npm command to run later.
npm_command="${1:-dev}"

# Navigate to the script dir, basically using this as a baseline location.
pushd $(dirname "$0") >/dev/null

# Navigate to the root folder of the project, in order for sail to run succesfully.
pushd ../ >/dev/null

# Install sail
if [ ! -f $sail ]; then
    docker run --rm -u 1000:1000 -v ${PWD}:/app -w /app laravelsail/php81-composer composer install && npm install
fi

# Stop any running sail instances and remove volumes
$sail down --volumes

# Start sail in detached mode
$sail up --detach

# Update PHP dependencies
$sail composer install

# Install node modules
$sail npm install

# Run migrations and seed the database
$sail artisan migrate:fresh --seed

# BEGIN: scripts that we think fixes unimaginable errors.
# Make sure that cache is cleared and reset.
$sail artisan optimize:clear
# END: scripts that we think fixes unimaginable errors.

# Compile assets
$sail npm run $npm_command