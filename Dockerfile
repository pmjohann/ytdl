FROM alpine:3.17.3
COPY --from=rclone/rclone /usr/local/bin/rclone /usr/local/bin/rclone
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN apk add --no-cache yt-dlp ffmpeg && \
    chmod +x /docker-entrypoint.sh && \
    yt-dlp --version
WORKDIR /dl
ENTRYPOINT ["/docker-entrypoint.sh"]
