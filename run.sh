#!/bin/bash

case "$1" in
  "--front-new")
    mkdir apps;
    projectName=$(basename "$2");
    echo "sudo docker-compose run --rm -v $(pwd)/apps/:/src/ node ng new $projectName"
    sudo docker-compose run --rm -v $(pwd)/apps/:/src/ node ng new $projectName
    sudo chown -R $3:$4 $2
    echo "${green}Success: project $projectName was created in folder  $(pwd)/apps/:/src/"
    ;;
  "--front-serve")
    echo  "docker-compose run -v /home/saad/Projects/docker-angular/:/src/ --publish 4200:4200 node bash /src/script/server $2"
    sudo docker-compose run -v  $(pwd)/apps/:/src/ --publish 4200:4200 node bash scripts/ng-server.sh $2
    ;;
  "--front-build")
    echo "docker-compose run --rm -d -v /home/saad/Projects/docker-angular/$2:/src/$2 node ng build"
    sudo sudo docker-compose run -v /$(pwd)/apps:/src/ node bash scripts/ng-build.sh $2
    ;;
  *)
    echo "You have failed to specify what to do correctly."
    mkdir -p $2
    exit 1
    ;;
esac
