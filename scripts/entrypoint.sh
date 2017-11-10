#!/bin/bash

if [[ -z ${RUBYMINE_TESTS+x} ]]; then
    exec "$@"
else
    if [ -d "/app/docker/bootstrap" ]; then
        # If you put application bootstrapping scripts in a docker/bootstrap folder they will always be run before tests start
        for f in /app/docker/bootstrap/*; do source $f; done
    fi
    xvfb-run -a "$@"
fi
