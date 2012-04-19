#!/bin/bash -xe

# Clean up build artifacts from previous runs.
git clean -fdx

# Make sure this runs, even if something blows up.
trap "bundle exec rake signonotron:stop" EXIT

bundle install --path "${HOME}/bundles/${JOB_NAME}"
bundle exec rake test
bundle exec rake signonotron:start spec
