#! /bin/bash

if ! pgrep -fxc "$*" > /dev/null
then
    exec "$*"
fi
