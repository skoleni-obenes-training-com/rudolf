FROM golang:1.24 AS build
COPY src /src

RUN CGO_ENABLED=0 go build -o /server /src/server.go

FROM scratch
COPY --from=build /server /server
COPY src/content /content
CMD ["/server"]
