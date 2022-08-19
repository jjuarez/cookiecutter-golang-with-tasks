# syntax=docker/dockerfile:1.4
FROM golang:1.19-alpine3.16 AS builder

WORKDIR /build
COPY go.mod go.sum ./
RUN go mod download
COPY . ./
RUN go build -v -o ./dist/service main.go


FROM alpine:3.16 AS debug
ARG UID=1001

WORKDIR /app
USER ${UID}
COPY --from=builder --chown=${UID}:${UID} /build/dist/service ./service
CMD [ "/app/service" ]
