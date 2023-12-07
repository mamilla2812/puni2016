#!/usr/bin/env bash

RUNNING=$(docker inspect --format="{{ .State.Running }}" project6 2> /dev/null)
if [ $? -eq 1 ] || [ "$RUNNING" == "false" ]; then
    rm -rfv ./artifact/*.war

    docker run \
        -d \
        --rm \
        --name project6 \
        -p 8080:8080 \
        -p 4848:4848 \
        -p 8009:8009 \
        -p 8181:8181 \
        -v "$(pwd)/artifact:/autodeploy" \
        ivonet/payara:4

    echo "WildFly admin console credentials:"
    echo "Url: http://localhost:4848"
    echo "Usr: admin"
    echo "Pwd: secfet"

    mvn clean package
else
    /usr/bin/osascript -e 'display notification "Stopping..." with title "project6"'
    docker rm -f project6
fi

