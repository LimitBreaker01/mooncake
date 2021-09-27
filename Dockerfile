FROM debian
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install git wget unar sed openssh-server   -y
RUN wget -q https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.deb
RUN dpkg -i cloudflared-stable-linux-amd64.deb
RUN wget https://github.com/niruix/sshwifty/releases/download/0.2.2-beta-release-prebuild/sshwifty_0.2.2-beta-release_linux_amd64.tar.gz
RUN tar -xzvf ./sshwifty_0.2.2-beta-release_linux_amd64.tar.gz
RUN cp ./sshwifty_linux_amd64 /bin/sshwifty 
RUN chmod 777 /bin/sshwifty
RUN sed -i 's@"ListenPort": 8182,@"ListenPort": 80,@g' ./sshwifty.conf.example.json
RUN cp ./sshwifty.conf.example.json /etc/sshwifty.conf.json
RUN nohup ./sshwifty_linux_amd64
RUN cloudflared tunnel --url localhost:80
//RUN nohup ngrok http 80
