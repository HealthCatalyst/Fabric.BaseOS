docker stop fabric.baseos
docker rm fabric.baseos
docker build -t healthcatalyst/fabric.baseos . 

docker run --rm --name fabric.baseos -it healthcatalyst/fabric.baseos sh
