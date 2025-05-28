IMAGE_NAME="cash-tracker-server"
CONTAINER_ID=$(docker images --filter=reference=$IMAGE_NAME -q)

if [ ! -z $CONTAINER_ID ]; then
    docker rmi $CONTAINER_ID -f
fi
docker build -t $IMAGE_NAME "."
docker run -it -v "$(pwd):/home/workspace" -p 8000:8000 $IMAGE_NAME
