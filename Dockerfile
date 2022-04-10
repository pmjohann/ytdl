FROM alpine:3.15.4
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN apk add --no-cache python2 ffmpeg && \
    wget -O /usr/bin/youtube-dl "https://yt-dl.org/downloads/latest/youtube-dl" && \
    chmod +x /usr/bin/youtube-dl && \
    chmod +x /docker-entrypoint.sh && \
    youtube-dl --version
WORKDIR /dl
ENTRYPOINT ["/docker-entrypoint.sh"]
