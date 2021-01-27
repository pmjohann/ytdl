FROM alpine:3.13
RUN apk add --no-cache youtube-dl ffmpeg
WORKDIR /dl
ENTRYPOINT ["/usr/bin/youtube-dl"]
