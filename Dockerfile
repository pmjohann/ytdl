FROM alpine:3.14
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN apk add --no-cache python2 ffmpeg && \
    wget -O /usr/bin/youtube-dl "https://yt-dl.org/downloads/latest/youtube-dl" && \
    youtube-dl --version
WORKDIR /dl
ENTRYPOINT ["/docker-entrypoint.sh"]
