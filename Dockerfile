FROM golang:alpine3.19 as golang_image
WORKDIR /app
COPY . .
RUN go build -o /src hello-fullcycle.go

FROM scratch
WORKDIR /
COPY --from=golang_image /src /src
ENTRYPOINT ["/src"]