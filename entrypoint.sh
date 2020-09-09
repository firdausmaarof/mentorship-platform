#!/bin/bash
set -e

echo "Creating database if it's not present..."
bin/rails db:create

echo "Migrating database..."
bin/rails db:migrate

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"