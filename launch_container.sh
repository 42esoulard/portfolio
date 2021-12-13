#!/bin/bash

docker build -t portfolio .

docker run -it -v ${PWD}/src:/app/src -v /app/node_modules -p 8081:8080 --name portfolio --rm portfolio npm run serve