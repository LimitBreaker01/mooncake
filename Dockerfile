FROM debian
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install git wget unar sed  -y
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
RUN unar -e GBK ngrok-stable-linux-amd64.zip
RUN cp ./ngrok /bin/
RUN ./ngrok authtoken 1aG34LqQT3PqA8YU6gxJJ8bIQZ5_4xQpvkxT7jr1p8EmjMMUj
RUN wget https://github.com/nirui/sshwifty/releases/download/0.2.14-beta-release-prebuild/sshwifty_0.2.14-beta-release_linux_arm64.tar.gz
RUN tar -xzvf ./sshwifty_0.2.14-beta-release_linux_arm64.tar.gz
RUN cp ./sshwifty_linux_arm64 /bin/sshwifty 
RUN chmod 777 /bin/sshwifty
RUN sed -i 's@"ListenPort": 8182,@"ListenPort": 80,@g' ./sshwifty.conf.example.json
RUN cp ./sshwifty.conf.example.json /etc/sshwifty.conf.json
RUN sshwifty
RUN nohup ngrok http 80
EXPOSE 80
