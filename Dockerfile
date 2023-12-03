FROM ubuntu:24.04

RUN apt-get -yq update && apt-get -yq install git wget
WORKDIR /usr/local
RUN wget https://downloads.factorcode.org/releases/0.99/factor-linux-x86-64-0.99.tar.gz && \
    tar xzf factor-linux-x86-64-0.99.tar.gz && \
    rm factor-linux-x86-64-0.99.tar.gz
RUN ln -s /usr/local/factor/factor /usr/local/bin/factor

# In the Ubuntu 24.04 docker image the ubuntu user is UID/GID 1000/1000
# This is the same as the defualt (first) user in a desktop distro install
USER ubuntu

RUN sed -i "1iexport TERM=xterm-256color" /home/ubuntu/.bashrc

WORKDIR /home/ubuntu
