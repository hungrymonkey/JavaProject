# How to use docker

## Find docker images
docker images

## Build Docker images
```
docker build /path/to/project_root -f Dockerfile -t 'vmware:dev'
```

## Run Docker Server and mount host directory onto the docker container
```
docker run -v /path/to/JavaProject:/code/ vmware:dev python3 server.py
```

## Run docker interactively.
```
docker run -it -v /path/to/JavaProject:/code/ vmware:dev bash
```

## Links
https://hub.docker.com/_/python/

