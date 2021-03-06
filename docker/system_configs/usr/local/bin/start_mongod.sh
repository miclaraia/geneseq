#!/bin/bash

/usr/bin/mongod &

LOOP_LIMIT=60
for (( i=0 ; ; i++ )); do
    if [ ${i} -eq ${LOOP_LIMIT} ]; then
        echo "Time out. Error log is shown as below:"
        exit 1
    fi
    echo "=> Waiting for confirmation of Mongodb service startup, trying ${i}/${LOOP_LIMIT} ..."
    sleep 1
    mongo --eval "db.stats()" && break
done
exit 0