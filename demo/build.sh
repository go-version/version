#!/bin/bash

version=$(git describe --tags --always)

# Trim leading v if next character is a number.
# This turns 'v1.0.0' into '1.0.0'.
if [[ "${version}" == v[0-9]* ]]; then
    version="${version#v}"
fi

# Parse out the Go version because it is needed in the next step.
# The output of `go version` looks like:
#   go version go1.5.3 linux/amd64
# Take the third word.
go_version=$(go version | cut -d' ' -f3)

# Syntax for -X changed in Go 1.5. Before 1.5 the syntax was:
#   -X importpath.name value
# Since 1.5 the syntax is:
#   -X importpath.name=value
# If you know your build uses one or the other then this can be simplified.
if [[ "${go_version}" < go1.5 ]]; then
    version_ld="version.version ${version}"
else
    version_ld="version.version=${version}"
fi

# Print the build command and build the thing.
(set -x;
    go build \
    -ldflags "-X github.com/go-version/${version_ld}" \
    ./demo.go)

echo "
    Finished building go-version demo.
    Test it with:  ./demo -version
"
