#!/usr/bin/env groovy

env.RUBY_VERSION=2.3

node('docker') {
  checkout scm

  def newImage

  stage('Pull latest base image') {
    baseImage = docker.image('ubuntu:xenial')
    baseImage.pull()
  }

  stage('Build Image') {
    newImage = docker.build "ninech/ruby:${env.RUBY_VERSION}"
  }

  stage('Test image') {
    newImage.inside { c ->
      assert sh(script: 'ruby -v', returnStdout: true) =~ /^ruby 2\.3/
    }
  }

  stage('Push image to registry') {
  }
}
