# go-version

This tiny package provides a string variable to hold the version of your
application. It can be set at link time by your build script. See the demo
directory for an example build script and application.

## Installation and Usage

Install using `go get github.com/go-version/version`.

Modify your build script to pass the version in `-ldflags` to `go build`. For
Go >=1.5:

    go build \
        -ldflags "-X github.com/go-version/version.version=${my_version}" \
        # ... possible other flags
        your/main.go

For Go <1.5 the syntax is a bit different. The equal sign is replaced by a
space:

    go build \
        -ldflags "-X github.com/go-version/version.version ${my_version}" \
        # ... possible other flags
        your/main.go

The version set by the build script is exposed as `version.Version()`:

    import (
        "fmt"
        "github.com/go-version/version"
    )

    func main() {
        fmt.Println(version.Version())
    }
