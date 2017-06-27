#!/bin/sh

# Pre-install latest versions of some widely used gems
gem install --no-document nokogiri pg rails capybara-webkit

# Pre-install commonly used versions of some gems
gem install --no-document nokogiri        -v '1.7.2'
gem install --no-document rails           -v '5.0.4'
gem install --no-document rails           -v '4.2.9'
