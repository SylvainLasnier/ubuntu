FROM ubuntu:14.04
MAINTAINER  Sylvain Lasnier <sylvain.lasnier@gmail.com>

# Install packages
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y install curl bash-completion vim-tiny supervisor

# Setup root password
RUN echo root:root | chpasswd

# Language setup
#locale-gen  fr_FR.UTF-8 en_US.UTF-8
#ENV LANG en_US.UTF-8
#ENV LANGUAGE en_US.UTF-8
#ENV LC_ALL en_US.UTF-8
