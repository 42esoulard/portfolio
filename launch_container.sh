#!/bin/bash

docker build -t portfolio .

docker run -it -v ${PWD}:/app -p 8080:8080 portfolio npm run serve