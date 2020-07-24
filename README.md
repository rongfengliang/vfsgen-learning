# vfsgen learning

## how to running

* generate vfs

```code
go run cmd/main.go
```

* run http server

```code
go run main.go
```

* view webpage

```code
http://localhost:9090/login/pre/
http://localhost:9090/login/dev
```

* build binary

> gox tools

```code
go get github.com/mitchellh/gox
gox
```


## some notes

* for combine resource

> use union 

```code
var Assets = union.New(map[string]http.FileSystem{
		"/login/dev": http.Dir("./resource/dev"),
		"/login/pre": http.Dir("./resource/pre"),
})

```

* location

> with golang http server

```code

http.Dir should be same as vfgen

```