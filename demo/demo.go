package main

import (
	"flag"
	"fmt"

	"github.com/go-version/version"
)

var versionFlag = flag.Bool("version", false, "print version and exit")

func main() {
	flag.Parse()
	if *versionFlag {
		fmt.Println(version.Version())
		return
	}
	flag.Usage()
}
