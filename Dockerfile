FROM debian
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install git wget unar sed openssh-server   -y
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
RUN unar -e GBK ngrok-stable-linux-amd64.zip
RUN cp ./ngrok /bin/
RUN ./ngrok authtoken 1aG34LqQT3PqA8YU6gxJJ8bIQZ5_4xQpvkxT7jr1p8EmjMMUj
RUN sed -i 's/#Port 22/Port 80/' /etc/ssh/sshd_config
RUN chmod 777 /etc/ssh*
RUN chmod 777 /usr/local/etc/ssh*
RUN systemctl start sshd
RUN nohup ngrok tcp 80
EXPOSE 80
