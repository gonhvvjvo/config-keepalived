#!/bin/sh

CONTAINER_NAME="simple-service"
CONTAINER_ID=$(docker inspect --format="{{.Id}}" ${CONTAINER_NAME} 2> /dev/null)
RUNNING=$(docker inspect --format="{{.State.Running}}" $CONTAINER_ID 2> /dev/null)

if [[ "${CONTAINER_ID}" ]]; then
  echo "FOUND $CONTAINER_NAME CONTAINER"
  if [ "$RUNNING" == "false" ]; then
    echo "CONTAINER $CONTAINER_NAME IS NOT RUNNING"
    false
    exit
  else
    echo "CONTAINER $CONTAINER_NAME IS RUNNING"
    true
    exit
  fi
else
  echo "CONTAINER $CONTAINER_NAME NOT FOUND"
  false
  exit
fi
