# A hardened nodejs docker image 
See this sample docker-compose.yml to understand how to use this image:
```
sample-app:
  image: 'nestoru/nodejs-hardened:0.1'
  restart: always
  container_name: sample-app
  ports:
    - 9999:9999
  volumes:
    - /home/ubuntu/workspace/docker/nodejs-hardened/sample-app:/app
    - /etc/timezone:/etc/timezone:ro
```
## Some useful commands
Run the app using docker-compose.yml
```
docker-compose stop sample-app; docker-compose up -d sample-app
```

Clone, build, tag and push
```
git clone git@github.com:nestoru/nodejs-hardened.git
cd nodejs-hardened 
docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
docker rmi --force $(docker images -q)
docker build . -t nestoru/nodejs-hardened:0.1
docker tag nestoru/nodejs-hardened:0.1 nestoru/nodejs-hardened:0.1
docker push nestoru/nodejs-hardened:0.1
```

Run, inspect logs, get into the container shell
```
docker logs nodejs -f
docker exec -ti nodejs bash
```
