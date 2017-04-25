FROM docker-registry.nine.ch/ninech/ubuntu:xenial
MAINTAINER development@nine.ch

ENV DEBIAN_FRONTEND=noninteractive

# Install essential dev tools
RUN apt-get update &&  apt-get -qq install -y \
      locales \
      ruby ruby-dev \
      libpq-dev postgresql-client \
      libmysqlclient-dev mysql-client \
      netcat-openbsd \
      git \
      nodejs nodejs-legacy npm \
      xvfb qt5-default libqt5webkit5-dev libqtwebkit-dev \
      build-essential \
      dbus gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

# Needed by xvfb-run or teaspoon
RUN dbus-uuidgen > /var/lib/dbus/machine-id

# Install a recent bundler version
RUN gem install bundler --no-document

# Helper scripts and configs
COPY scripts/* /usr/local/bin/
COPY rspec-config /root/.rspec
COPY pry-config /root/.pryrc

# Create base directory for the application
RUN mkdir -p /app
WORKDIR /app

# Create the logs folder
RUN mkdir -p /app/log/
