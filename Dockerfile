FROM ubuntu:latest

WORKDIR /app
RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    git


COPY . .
CMD /bin/bash
