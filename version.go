package version

// Set during your build by:
// -ldflags "-X github.com/go-version/version.version=x.y.z"
var version string

func Version() string {
	if version == "" {
		return "unknown"
	}
	return version
}
