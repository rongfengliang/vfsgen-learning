package main

import (
	"log"
	"net/http"

	"github.com/shurcooL/httpfs/union"
	"github.com/shurcooL/vfsgen"
)

func main() {
	// use union for combin resource
	var Assets = union.New(map[string]http.FileSystem{
		"/login/dev": http.Dir("./resource/dev"),
		"/login/pre": http.Dir("./resource/pre"),
	})
	var fs http.FileSystem = Assets
	err := vfsgen.Generate(fs, vfsgen.Options{
		PackageName:  "dist",
		Filename:     "./dist/mydir-dist.go",
		VariableName: "MyDir",
	})
	if err != nil {
		log.Fatalln(err)
	}
}
