#!/bin/bash

docker build -t portfolio .

docker run -it -v ${PWD}:/app -p 8081:8080 --rm portfolio npm run serve