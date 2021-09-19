FROM debian
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install firefox-esr mate-system-monitor  git lxde tightvncserver wget unar   -y
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
RUN unar -e GBK ngrok-stable-linux-amd64.zip
RUN cp ./ngrok /bin/
RUN ./ngrok authtoken 1aG34LqQT3PqA8YU6gxJJ8bIQZ5_4xQpvkxT7jr1p8EmjMMUj
echo '!@#$5678'|passwd --stdin root
RUN ngrok tcp 22
