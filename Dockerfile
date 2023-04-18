FROM golang:1.12.0-alpine3.9 as builder

RUN mkdir /app
ADD . /app
WORKDIR /app

RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o main .

FROM scratch
WORKDIR /app
COPY --from=builder /app/main .

CMD ["/app/main"]