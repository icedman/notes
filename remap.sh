#!/bin/sh
evsieve --input /dev/input/event4 grab    \
        --map yield key:rightctrl key:up  \
        --map yield key:rightalt key:left   \
        --output
