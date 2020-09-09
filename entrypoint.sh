#!/bin/bash
set -e

echo "Precompile assets"
bundle exec rake assets:precompile

echo "Migrating database..."
bin/rails db:migrate

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"