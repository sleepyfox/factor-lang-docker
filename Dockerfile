FROM ubuntu:22.04

RUN apt-get -yq update && apt-get -yq install git wget
WORKDIR /usr/local
RUN wget https://downloads.factorcode.org/releases/0.98/factor-linux-x86-64-0.98.tar.gz && \
    tar xzf factor-linux-x86-64-0.98.tar.gz && \
    rm factor-linux-x86-64-0.98.tar.gz
RUN ln -s /usr/local/factor/factor /usr/local/bin/factor

# Set group and user IDs for docker user
ARG GID=1000
ARG UID=1000
ARG USER=me

# Create the group and user
RUN groupadd -g $GID $USER
RUN useradd -g $GID -m -u $UID -d /home/$USER $USER
USER $USER
RUN sed -i "1iexport TERM=xterm-256color" /home/$USER/.bashrc

WORKDIR /var/app
