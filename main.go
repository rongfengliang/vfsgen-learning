package main

import (
	"net/http"

	"github.com/rongfengliang/demoapp/dist"
)

func main() {
	http.Handle("/login/pre/", http.FileServer(dist.MyDir))
	http.Handle("/login/dev/", http.FileServer(dist.MyDir))

	http.ListenAndServe(":9090", nil)
}
