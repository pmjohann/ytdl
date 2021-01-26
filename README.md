# ytdl
Containerized video downloader

## How to run

```sh
docker run --rm -it -v $(pwd):/dl pmjohann/ytdl $URL
```

This will download content at $URL to the current working directory.
