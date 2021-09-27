FROM debian
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install git wget unar sed openssh-server npm nohup  -y
RUN wget -q https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.deb
RUN dpkg -i cloudflared-stable-linux-amd64.deb
RUN git clone https://github.com/krishnasrinivas/wetty
RUN cd wetty
RUN npm install
RUN node app.js -p 3000
RUN cloudflared tunnel --url localhost:3000
