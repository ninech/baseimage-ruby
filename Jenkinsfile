#!/usr/bin/env groovy

env.RUBY_VERSION=2.3

node('docker') {
  checkout scm

  stage('Build Image') {
    image = docker.build "ninech/ruby:${env.RUBY_VERSION}"
  }

  stage('Push image to registry') {
  }
}
