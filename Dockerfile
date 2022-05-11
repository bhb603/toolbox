FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
  curl \
  dnsutils \
  gnupg \
  jq \
  less \
  netcat \
  nmap \
  postgresql postgresql-contrib \
  telnet \
  unzip \
  vim \
  wget && \
  # Mongo
  wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | apt-key add - && \
  echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list && \
  apt-get update && apt-get install -y mongodb-org && \
  # AWS
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
  unzip awscliv2.zip && \
  ./aws/install && \
  rm awscliv2.zip

RUN useradd --uid 1001 toolbox
USER 1001

ENTRYPOINT ["/bin/bash"]
