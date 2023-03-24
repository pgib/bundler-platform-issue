#!/bin/sh

VERSIONS="3.4.7 3.4.8 3.4.9"

# Uncomment to force a particular architecture
#PLATFORM_ARG="--platform linux/amd64"
#PLATFORM_ARG="--platform linux/arm64"

for version in ${VERSIONS}; do
  echo "==============================================================="
  echo ""
  echo "Building Docker image for Rubygems ${version}..."
  docker build \
	  --quiet \
	  ${PLATFORM_ARG:-} \
	  --build-arg RUBYGEMS_VERSION=${version} \
	  --tag ruby-bundler-${version} \
	  . >/dev/null
  docker run \
	  ${PLATFORM_ARG:-} \
	  -it \
	  --rm \
	  --entrypoint /root/entrypoint.sh \
	  ruby-bundler-${version}
done
