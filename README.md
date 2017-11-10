# nine.ch Ruby base image

The image contains Ruby 2.3 along with client libraries for MySQL and Postgresql. Additionally there is `xvfb` and some webkit libraries for testing. NodeJS is also there.

## How to use

In the `Dockerfile`:

    FROM <registry url>/ninech/ruby

The working directory is set to `/app`. So you have to copy your app into that directory or map a volume to it.

## Helper Scripts

`waitfortcp` waits for a specific service to come up. Use it in your start scripts to wait for a service:

    waitfortcp mysql 3306

`waitforpg` waits for Postgres to be fully up and running. Configuration is done via environment variables.

    export POSTGRES_HOST=postgres
    waitforpg

`setup_pg` initializes a Rails app's Postgresql database. It checks if the database exists and does nothing if the database is already there.

`setup_mysql` initializes a Rails app's MySQL database. It checks if the database exists and does nothing if the database is already there.

## Aliases

The following aliases can be used in Bash:

* `bi`: bundle install
* `be`: bundle exec
* `rc`: bundle exec rails console
* `ttr`: touch tmp/restart.txt

The following Git alises exist:

* `git co`: Short for `git checkout`
* `git l`: Some nicer looking and more compact `git log`
* `git s`: A short version of `git status`

## Rubymine

This image can be used with rubymine to test and debug applications

To enable debugging nothing further is needed, provided that your application includes the [appropriate debugging gems](https://blog.jetbrains.com/ruby/2017/06/rubymine-2017-2-eap-5-debugging-with-docker-compose/).

To enable testing set the environmental variable RUBYMINE_TESTS to true.
If your application requires bootstrapping scripts to run before debugging is started place them in the container dir /app/docker/boostrap/ and they will be auto sourced

## About

This docker image is currently maintained and funded by [nine](https://nine.ch).

[![logo of the company 'nine'](https://logo.apps.at-nine.ch/Dmqied_eSaoBMQwk3vVgn4UIgDo=/trim/500x0/logo_claim.png)](https://www.nine.ch)
