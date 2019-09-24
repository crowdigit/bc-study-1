#!/bin/bash

docker rm $(docker ps --all --quiet --filter "name=uwu")
docker rmi $(docker image ls --quiet uwu-*)
