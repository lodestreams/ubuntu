#
# Ubuntu Dockerfile
#
# https://github.com/youdarnet/ubuntu
#

# Base image.
FROM ubuntu:14.04

# Install 
RUN \
  # sed -i 's%us.archive.ubuntu.com%mirrors.163.com/ubuntu%' /etc/apt/sources.list
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y software-properties-common && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y build-essential && \
  apt-get install -y tmux curl git htop man unzip vim wget axel python python-dev python-pip python-virtualenv oracle-java8-installer && \
  curl -L http://git.io/n-install | bash && \

# Add files.
ADD root/.zshrc /root/.zshrc
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
