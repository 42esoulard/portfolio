#!/bin/bash

docker build -t portfolio .

docker run -it -v ${PWD}:/app -v /app/node_modules -p 8080:8080 --name portfolio --rm portfolio npm run serve