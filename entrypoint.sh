#!/bin/sh

echo "Doing initial bundle..."
bundle --quiet

grep -A 2 PLATFORMS Gemfile.lock

sleep 2

echo "gem 'rack'" >> Gemfile

echo "Doing second bundle after adding gem..."
bundle --quiet

grep -A 2 PLATFORMS Gemfile.lock
