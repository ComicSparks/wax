package main

import (
	"bytes"
	"ci/commons"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"os"
)

func main() {
	// get ghToken
	ghToken := os.Getenv("GITHUB_TOKEN")
	if ghToken == "" {
		println("Env ${GITHUB_TOKEN} is not set")
		os.Exit(1)
	}
	// get version
	version := commons.LoadVersion()
	// get version
	githubRepository := os.Getenv("GITHUB_REPOSITORY")
	if githubRepository == "" {
		println("Env ${GITHUB_REPOSITORY} is not set")
		os.Exit(1)
	}
	println("REPO: ", githubRepository)
	getReleaseRequest, err := http.NewRequest(
		"GET",
		fmt.Sprintf("https://api.github.com/repos/%v/releases/tags/%v", githubRepository, version.Code),
		nil,
	)
	if err != nil {
		panic(nil)
	}
	getReleaseRequest.Header.Set("User-Agent", commons.Ua)
	getReleaseRequest.Header.Set("Authorization", "token "+ghToken)
	getReleaseResponse, err := http.DefaultClient.Do(getReleaseRequest)
	if err != nil {
		panic(nil)
	}
	defer getReleaseResponse.Body.Close()
	if getReleaseResponse.StatusCode == 404 {
		url := fmt.Sprintf("https://api.github.com/repos/%v/releases", githubRepository)
		body := map[string]interface{}{
			"tag_name":         version.Code,
			"target_commitish": commons.MainBranch,
			"name":             version.Code,
			"body":             version.Info,
		}
		var buff []byte
		buff, err = json.Marshal(&body)
		if err != nil {
			panic(err)
		}
		var createReleaseRequest *http.Request
		createReleaseRequest, err = http.NewRequest("POST", url, bytes.NewBuffer(buff))
		if err != nil {
			panic(nil)
		}
		createReleaseRequest.Header.Set("User-Agent", commons.Ua)
		createReleaseRequest.Header.Set("Authorization", "token "+ghToken)
		var createReleaseResponse *http.Response
		createReleaseResponse, err = http.DefaultClient.Do(createReleaseRequest)
		if err != nil {
			panic(nil)
		}
		defer createReleaseResponse.Body.Close()
		if createReleaseResponse.StatusCode != 201 {
			buff, err = ioutil.ReadAll(createReleaseResponse.Body)
			if err != nil {
				panic(err)
			}
			println(string(buff))
			panic("NOT 201")
		}
	}
}
