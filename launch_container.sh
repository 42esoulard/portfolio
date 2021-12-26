#!/bin/bash

docker build -t portfolio .

# docker run -it -d -p 8080:8080 --name portfolio --rm portfolio
# docker cp portfolio:/app/node_modules ./node_modules/
# docker stop portfolio

docker run -it -v ${PWD}:/app -p 8080:8080 --name portfolio --rm portfolio npm run serve