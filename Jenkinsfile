#!/usr/bin/env groovy

env.RUBY_VERSION=2.3

node('docker') {
  checkout scm

  stage('Pull latest base image') {
    image = docker.image('ubuntu:xenial')
    image.pull()
  }

  stage('Build Image') {
    image = docker.build "ninech/ruby:${env.RUBY_VERSION}"
  }

  stage('Push image to registry') {
  }
}
