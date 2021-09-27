FROM debian
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install git wget unar sed openssh-server curl  -y
RUN curl -fsSL git.io/speedtest-cli.sh | sudo bash
RUN while true ; do speedtest ; sleep 5 ; done;
