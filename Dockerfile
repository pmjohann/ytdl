ARG YT_DLP_VER=2023.07.06

FROM alpine:3.18.2
ARG YT_DLP_VER

COPY --from=rclone/rclone /usr/local/bin/rclone /usr/local/bin/rclone
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN apk add --no-cache python3 ffmpeg && \
    wget -O /usr/local/bin/yt-dlp "https://github.com/yt-dlp/yt-dlp/releases/download/${YT_DLP_VER}/yt-dlp" && \
    chmod +x /docker-entrypoint.sh && \
    chmod +x /usr/local/bin/yt-dlp
WORKDIR /dl
ENTRYPOINT ["/docker-entrypoint.sh"]
