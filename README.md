# Container

When run and build Dockerfile it create an container for this file (output of Dockerfile is container )

# Build image from Dockerfile
docker build -t my-node-app .

# Run the container and map port 4000 to your local machine
docker run -p 4000:4000 my-node-app

# Run Dockerfile
For run Dockerfile we go to terminal and write
docker build ./Dockerfile OR docker build . 

. It will go to search inside app and looking for file name Dockerfile if it exist in current directory and build image from it

This will create an image from Dockerfile so if I want to add name to this image run
docker build -t express-node-app . 

-t mean tag

Express-node-app ( name for image)
- docker build --no-cache -t express-node-app . (This mean build an image without caching)
It forces Docker to rebuild every step from scratch, ignoring any cached layers from previous builds.

# List Of Images

For see list of images and image that build from Dockerfile we use

docker image ls  

# Run Container

For create container from this image we can use
docker run --name express-node-app-container express-node-app

--name express-node-app-container (Name of container) 
Express-node-app run container from image name (express-node-app)

# Remove Container

docker rm express-node-app-container

OR

docker rm express-node-app-container -f

-f means "force" — it forcefully removes the container, even if it's currently running.

Express-node-app-container (name of container that provide previous)

# -d flag detached

 docker run --name express-node-app-container -d express-node-app

The -d flag in the docker run command stands for "detached mode".

When you run a container with -d, Docker:

Starts the container in the background

Does NOT attach your terminal to the container’s output

Returns control to your terminal immediately (so you can keep working)

# Port forward

docker run --name express-node-app-container -d -p 4000:4000 express-node-app

"Map port 4000 on your host machine to port 4000 inside the container."

First 4000 (left side):

Port on your host machine (your computer)

Second 4000 (right side):

Port inside the container, where your Node.js app is running

This mean if on my machine on localhost it hit 4000 then map or forward to container 4000

# Open terminal on container

For open terminal on container we do 

docker exec -it  express-node-app-container bash

-it => interactive terminal 

Exec => نفذلي bash على ال container المعين (Execute bash on specific container)

# To see logs on specific container
Docker ps => to see name of container

The 

docker logs express-node-app-container

Express-node-app-container (Name of container)

# Note !!!
When make any changes on Dockerfile you should build a new image remove old one and build new image

# Docker hot reload

NOTE : when run command try to remove -d to see result

docker run --name express-node-app-container -v /home/eyad/Desktop/node-app:/app  -d -p 4000:4000 express-node-app

-v mean volume => make sync from /home/eyad/Desktop/node-app (My machine or path of project)

With directory from container Dockerfile name => app (it appear on Dockerfile workdirectory)

Sync with folder inside container

# Problem when using hot reload

Problem when using this sync or mirror is when try to add or delete files from inside 

container using terminal when open terminal from container it remove from my project 

also because it’s synced with each other this is BAD behaviour

# For solve problem hot reload

Issue that if we change on container inside terminal it will affected to my machine or project so if delete file from container 

it delete it from my project and this is wrong and this way is known as two way binding so to avoid it we can do following

From this => docker run --name express-node-app-container -v /home/eyad/Desktop/node-app:/app  -d -p 4000:4000 express-node-app

To this => docker run --name express-node-app-container -v /home/eyad/Desktop/node-app:/app:ro  -d -p 4000:4000 express-node-app 

:ro => read only (One way binding)

# Alternative for hot reload

docker run --name express-node-app-container -v ${pwd}:/app  -d -p 4000:4000 express-node-app

This work for mac and linux

pwd => print working directory

For windows 

docker run --name express-node-app-container -v %cd%:/app  -d -p 4000:4000 express-node-app

%cd% => for get current directory in windows

# When delete or update file or folder from machine don’t take change to container

docker run --name express-node-app-container -v /home/eyad/Desktop/node-app:/app:ro -v /app/node_module  -d -p 4000:4000 express-node-app 

-v /app/node_module => this mean when delete this file or folder don’t affected on container meaning don’t delete it on container 

(Not just delete I mean any changes)

# docker-compose

Docker compose yml file is an just utilities for docker file to not write big command in terminal to build image 

then run container from that image so we write docker compose yml file
 
When run docker-compose up -d it will first build an image then create docker file with name that be in docker compose yml

and image name it will created random it will take name of your project folder and add - with service name inside docker compose yml file

docker-compose up -d => run image and build container without open terminal -d

Docker-compose down => stop container




