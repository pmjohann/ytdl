FROM alpine:3.13
RUN apk add --no-cache youtube-dl
WORKDIR /dl
ENTRYPOINT ["/usr/bin/youtube-dl"]
