FROM ubuntu:xenial
MAINTAINER development@nine.ch

ENV RUBY_VERSION=2.3
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -qq update && apt-get -qq install -y \
  build-essential \
  software-properties-common

RUN apt-add-repository ppa:brightbox/ruby-ng \
    && apt-get -qq update \
    && apt-get -qq install -y \
      ruby${RUBY_VERSION} ruby${RUBY_VERSION}-dev \
      libpq-dev postgresql-client \
      mysql-client \
      python-setuptools\
      netcat-openbsd \
      git \
      nodejs nodejs-legacy \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN gem install bundler

# Create base directory for the application
RUN mkdir -p /app
WORKDIR /app
