#!/bin/bash
YELLOW="\033[1;31m"
MAGENTA="\033[1;35m"
NC="\033[0;0m"

echo -e "${YELLOW}\nBUILDING DOCKER CONTAINER...${NC}\n"
docker build -t esoulard/portfolio .

echo -e "${YELLOW}\nSTARTING DOCKER CONTAINER...${NC}\n"
docker run -it -p 8080:80 esoulard/portfolio
# echo -e "${YELLOW}\nDOCKER CONTAINER RUNNING ON PORT 80!${NC}\n"
# docker run -it -p 8080:80 --rm --name dockerize-vuejs-app-1 vuejs-cookbook/dockerize-vuejs-app