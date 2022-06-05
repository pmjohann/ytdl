FROM alpine:3.16
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN apk add --no-cache python3 ffmpeg && \
    wget -O /usr/bin/youtube-dl "https://yt-dl.org/downloads/latest/youtube-dl" && \
    chmod +x /usr/bin/youtube-dl && \
    chmod +x /docker-entrypoint.sh && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    youtube-dl --version
WORKDIR /dl
ENTRYPOINT ["/docker-entrypoint.sh"]
