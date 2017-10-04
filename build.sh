#!/usr/bin/env bash

docker build -t buildvscode .

docker run -it -v $PWD/out:/out buildvscode
