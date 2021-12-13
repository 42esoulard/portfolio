#!/bin/bash

docker build -t portfolio .

docker run -it -v ${PWD}/src:/app/src -p 8080:8080 -d portfolio
# docker run -it -v ${PWD}/src:/app/src -p 8080:8080 portfolio sh