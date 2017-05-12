# A hardened nodejs docker image 
See this sample docker-compose.yml to understand how to use this image:
```
nodejs:
  image: 'nestoru/nodejs-hardened:0.1'
  restart: always
  container_name: nodejs
  ports:
    - 3443:3443
  volumes:
    - /opt/data/napi:/app
    - /etc/timezone:/etc/timezone:ro
  environment:
    - ...
```
## Some useful commands
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
