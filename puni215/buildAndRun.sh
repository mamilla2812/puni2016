#!/usr/bin/env bash
mvn clean package && docker build -t ivonet/project6 .
docker rm -f project6 || true && docker run -d -p 8080:8080 -p 9990:9990 --name project6 ivonet/project6
