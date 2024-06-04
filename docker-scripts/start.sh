#!/bin/bash

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 058264531795.dkr.ecr.us-east-1.amazonaws.com

docker pull 058264531795.dkr.ecr.us-east-1.amazonaws.com/sp-backend-app:latest

docker run --env-file /opt/sp-backend-app/.env -dit -p 5000:5000 --restart on-failure:5 --name backend 058264531795.dkr.ecr.us-east-1.amazonaws.com/sp-backend-app:latest
