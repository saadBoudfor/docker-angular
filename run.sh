#!/bin/bash

case "$1" in
  "--front-new")
    projectName=$(basename "$2");
    echo "docker-compose run --rm node ng new $projectNames"
    sudo docker-compose run --rm node ng new $projectName
    sudo chown -R $3:$4 ./apps/$2
    echo "${green}Success: project $projectName was created in folder $(pwd)/apps/"
    ;;
  "--front-serve")
    echo "docker-compose run --publish 4200:4200 node bash /usr/local/scripts/ng-server.sh $2"
    sudo docker-compose run --publish 4200:4200 node bash /usr/local/scripts/ng-server.sh $2
    ;;
  "--front-build")
    echo "docker-compose run node bash /usr/local/scripts/ng-build.sh $2"
    sudo sudo docker-compose run node bash /usr/local/scripts/ng-build.sh $2
    ;;
  *)
    echo "You have failed to specify what to do correctly."
    mkdir -p $2
    exit 1
    ;;
esac
