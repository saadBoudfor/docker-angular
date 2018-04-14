#!/bin/bash

case "$1" in
  "--new")
    sudo docker-compose run --rm -v /home/saad/Projects/docker-angular/:/src/ node ng new $2
    sudo chown -R $3:$4 $2
    ;;
  "--serve")
    echo "docker-compose run -v /home/saad/Projects/docker-angular/$2:/src/$2 --publish 4200:4200 node ng serve -H 0.0.0.0"
    sudo docker-compose run -v /home/saad/Projects/docker-angular/$2:/src/ --publish 4200:4200 node ng serve -H 0.0.0.0
    ;;
  "--bash-serve")
    echo "docker-compose run -v /home/saad/Projects/docker-angular/:/src/ --publish 4200:4200 node bash /src/script/server $2"
    sudo docker-compose run -v /home/saad/Projects/docker-angular/:/src/ --publish 4200:4200 node bash scripts/server.sh $2
    ;;
  "--build")
    echo "docker-compose run --rm -d -v /home/saad/Projects/docker-angular/$2:/src/$2 node ng build"
    sudo docker-compose run --rm -d -v /home/saad/Projects/docker-angular/$2:/src/$2 node ng build
    ;;
  *)
    echo "You have failed to specify what to do correctly."
    exit 1
    ;;
esac
