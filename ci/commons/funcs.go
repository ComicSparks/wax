package commons

import (
	"io/ioutil"
	"strings"
)

const Ua = "wax ci"
const MainBranch = "master"

func LoadVersion() Version {
	var version Version
	codeFile, err := ioutil.ReadFile("version.code.txt")
	if err != nil {
		panic(err)
	}
	version.Code = strings.TrimSpace(string(codeFile))
	infoFile, err := ioutil.ReadFile("version.info.txt")
	if err != nil {
		panic(err)
	}
	version.Info = strings.TrimSpace(string(infoFile))
	return version
}
