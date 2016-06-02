#
# Ubuntu Dockerfile
#
# https://github.com/youdarnet/ubuntu
#

# Base image.
FROM ubuntu:16.04
MAINTAINER Kun Ran "kun@youdar.net"

# Install 
RUN \
  # sed -i 's%us.archive.ubuntu.com%mirrors.163.com/ubuntu%' /etc/apt/sources.list
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y software-properties-common && \
  add-apt-repository -y ppa:webupd8team/java && \
  echo "oracle-java9-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections && \
  apt-get update && \
  apt-get install -y build-essential && \
  apt-get install -y tmux curl git htop man unzip vim wget axel python python-dev python-pip python-virtualenv && \
    oracle-java9-installer ruby ruby-dev ruby-bundler && \
  curl -L https://git.io/n-install | bash -s -- -y && \

# Add files.
ADD root/.bashrc /root/.bashrc

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
