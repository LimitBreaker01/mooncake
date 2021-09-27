FROM debian
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install git wget unar sed openssh-server  -y
RUN curl -fsSL git.io/speedtest-cli.sh | sudo bash
RUN speedtest
