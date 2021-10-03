FROM golang:1.17.1-bullseye AS builder
WORKDIR /go/src
COPY ./app.go .
RUN go mod init app && go build  -o ./app.go


FROM scratch
WORKDIR /app
COPY --from=builder  /go/src .
EXPOSE 6111
CMD ["./app.go"]

