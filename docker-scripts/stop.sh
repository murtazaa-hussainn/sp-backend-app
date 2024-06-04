#!/bin/bash

if [ $( docker ps -a | grep backend | wc -l ) -gt 0 ]; then
  docker stop backend
  docker rm backend
  docker rmi 058264531795.dkr.ecr.us-east-1.amazonaws.com/sp-backend-app:latest
fi

exit 0
