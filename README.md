# ytdl
Containerized video downloader

## How to run

```sh
docker run --rm -v $(pwd):/dl ghcr.io/pmjohann/ytdl $URL
```

This will download content at $URL to the current working directory.
