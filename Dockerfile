FROM ubuntu:14.04
MAINTAINER  Sylvain Lasnier <sylvain.lasnier@gmail.com>

# No terminal
ENV DEBIAN_FRONTEND noninteractive

# Add useful packages
RUN apt-get update
RUN apt-get -y install curl bash-completion vim-tiny supervisor

# Setup root password for login process
RUN echo root:root | chpasswd

# Language setup
RUN locale-gen  fr_FR.UTF-8 en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8
