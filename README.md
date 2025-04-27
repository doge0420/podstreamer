# Usage

## Build image
```shell
podman build -t yt-dlp .
``` 

## audio + video
```shell
podman run --rm -v "${PWD}\out:/home/downloader/downloads" yt-dlp "{VIDEO_LINK}"
``` 

## only audio
```shell
podman run --rm -v "${PWD}\out:/home/downloader/downloads" yt-dlp "{VIDEO_LINK}" "-x"
``` 
