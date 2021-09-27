FROM debian
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install git wget unar sed openssh-server   -y
RUN docker pull jialezi/aria2
