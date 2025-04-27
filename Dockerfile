# ← Step 1: start super-light Alpine Linux
FROM alpine:latest

# ← Step 2: install system deps in one layer
RUN apk add --no-cache \
      python3 \
      py3-pip \
      ffmpeg

# ← Step 3: install yt-dlp (latest) via pip
RUN pip install --no-cache-dir --break-system-packages yt-dlp

# ← Step 4: create a non-root user for safety
RUN adduser -D downloader

USER downloader
WORKDIR /home/downloader

# ← Step 5: default volume for downloads
VOLUME ["/home/downloader/downloads"]

# ← Step 6: expose downloads dir and set entrypoint
ENV OUTPUT_DIR=/home/downloader/downloads
ENTRYPOINT ["yt-dlp", "-o", "${OUTPUT_DIR}/%(title)s.%(ext)s", "-f", "bv*+ba/best"]

# ← (Optional) default to showing help if no args
CMD ["--help"]
