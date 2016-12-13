FROM docker-registry-default.nine.ch/ninech/ubuntu:xenial
MAINTAINER development@nine.ch

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update &&  apt-get -qq install -y \
      ruby ruby-dev \
      libpq-dev postgresql-client \
      libmysqlclient-dev mysql-client \
      netcat-openbsd \
      git \
      nodejs nodejs-legacy \
      xvfb qt5-default libqt5webkit5-dev libqtwebkit-dev \
      build-essential \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN gem install bundler --no-document

# Helper scripts
COPY bin/waitfor /usr/bin/

# Create base directory for the application
RUN mkdir -p /app
WORKDIR /app
