#
# Ubuntu Dockerfile
#
# https://github.com/youdarnet/ubuntu
#

# Base image.
FROM ubuntu:16.04
MAINTAINER Kun Ran "kun@youdar.net"

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Install 
RUN \
  # sed -i 's%us.archive.ubuntu.com%mirrors.163.com/ubuntu%' /etc/apt/sources.list
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y software-properties-common && \
  add-apt-repository -y ppa:webupd8team/java && \
  echo "oracle-java9-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections && \
  apt-get update && \
  apt-get install -y build-essential && \
  apt-get install -y tmux curl git htop man unzip vim wget axel python python-dev python-pip python-virtualenv oracle-java9-installer ruby ruby-dev ruby-bundler rake libssl-dev libyaml-dev libsqlite3-dev sqlite3 subversion zsh && \
  curl -L https://git.io/n-install | bash -s -- -y
  
RUN  git clone git://github.com/ryanb/dotfiles ~/.dotfiles && cd ~/.dotfiles && \
  yes | rake install && \
  git config --global user.name Youdar && \
  git config --global github.user "" && \
  git config --global github.token "" && \
  chsh -s $(which zsh) root

# Add files.
ADD .bashrc /root/.bashrc

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

EXPOSE 2016
