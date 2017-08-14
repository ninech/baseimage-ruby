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
