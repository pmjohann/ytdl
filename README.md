# ytdl
Containerized video downloader

## How to run

```sh
docker run --rm -v $(pwd):/dl ghcr.io/pmjohann/ytdl $URL
```

This will download content at $URL to the current working directory.

## Upload workdir contents using rclone after download

```sh
docker run --rm -it -v $(pwd):/dl -v /path/to/rclone.conf:/rclone.conf -e UPLOAD='remote:path/to/folder' ghcr.io/pmjohann/ytdl $URL
```
