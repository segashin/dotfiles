FROM ubuntu:latest

WORKDIR /app
RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    git \
    zsh

RUN chsh -s $(which zsh) root

COPY . .
CMD /bin/bash
