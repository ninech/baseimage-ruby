# nine.ch Ruby base image

The image contains Ruby 2.3 along with client libraries for MySQL and Postgresql. Additionally there is `xvfb` and some webkit libraries for testing. NodeJS is also there.

## How to use

In the `Dockerfile`:

    FROM <registry url>/ninech/ruby

The working directory is set to `/app`. So you have to copy your app into that directory or map a volume to it.

## Helper Scripts

`waitfor` waits for a specific service to come up. Use it in your start scripts to wait for a service:

    waitfor mysql 3306
