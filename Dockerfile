FROM golang:1.14-alpine AS build-env
WORKDIR /go/src/app
RUN  /bin/sed -i 's,http://dl-cdn.alpinelinux.org,https://mirrors.aliyun.com,g' /etc/apk/repositories

ENV  GO111MODULE=on
ENV  GOPROXY=https://goproxy.cn
RUN go get github.com/mitchellh/gox
COPY go.mod  .
COPY go.sum  .
COPY main.go  .
COPY resource ./resource
COPY dist ./dist
COPY cmd/main.go ./cmd/main.go
RUN apk update && apk add git \
    && go run cmd/main.go && gox

FROM alpine:latest
WORKDIR /app
RUN  /bin/sed -i 's,http://dl-cdn.alpinelinux.org,https://mirrors.aliyun.com,g' /etc/apk/repositories
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*
COPY --from=build-env /go/src/app/demoapp_* /app/
CMD ["/app/demoapp_linux_amd64"]