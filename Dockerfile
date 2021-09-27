FROM debian
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install git wget unar sed openssh-server curl ffmpeg aria2 -y
RUN apt-get install curl -y
RUN curl -L https://yt-dl.org/latest/youtube-dl -o /usr/bin/youtube-dl
RUN curl -L https://yt-dl.org/latest/youtube-dl -o /usr/bin/youtube-dl
RUN chmod 755 /usr/bin/youtube-dl
RUN youtube-dl -f bestvideo+bestaudio https://www.youtube.com/watch?v=XcQIXKbGios --external-downloader aria2c --external-downloader-args "-x 64 -k 1M" 
