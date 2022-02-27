FROM ubuntu:18.04
CMD /bin/bash 

RUN apt update
RUN apt install -y vim gcc gcc-multilib make

WORKDIR /usr/local/workspace
