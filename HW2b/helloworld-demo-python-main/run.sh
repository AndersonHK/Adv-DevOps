#!/bin/bash

 docker compose up -d --build
 secs=5
 echo "waiting for $secs seconds"
 #why is this wait needed?
 sleep $secs 
 curl localhost:8080
 