#!/bin/bash

case "$1" in
  "front --new")
    sudo docker-compose run --rm -v /home/saad/Projects/docker-angular/apps/:/src/ node ng new $2
    sudo chown -R $3:$4 apps/$2
    ;;
  "front --serve")
    echo  "docker-compose run -v /home/saad/Projects/docker-angular/:/src/ --publish 4200:4200 node bash /src/script/server $2"
    sudo docker-compose run -v /home/saad/Projects/docker-angular/apps/:/src/ --publish 4200:4200 node bash scripts/ng-server.sh $2
    ;;
  "front --build")
    echo "docker-compose run --rm -d -v /home/saad/Projects/docker-angular/$2:/src/$2 node ng build"
    sudo sudo docker-compose run -v /home/saad/Projects/docker-angular/apps:/src/ --publish 4200:4200 node bash scripts/ng-build.sh $2
    ;;
  *)
    echo "You have failed to specify what to do correctly."
    exit 1
    ;;
esac
