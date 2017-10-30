#!/bin/bash
TAG=0.1

docker build -t broyal/md-secure-renderer:$TAG app/.
docker build -t example --build-arg KEY=test123 example/.
docker rm -f $(docker ps -aq)
docker run -d -P -e KEY=test123 example
# docker exec -it $container sh