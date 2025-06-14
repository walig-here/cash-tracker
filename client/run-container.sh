IMAGE_NAME="cash-tracker-client"
CONTAINER_ID=$(docker images --filter=reference=$IMAGE_NAME -q)

if [ ! -z $CONTAINER_ID ]; then
    docker rmi $CONTAINER_ID -f
fi
docker build -t $IMAGE_NAME "."
docker run -it -v "$(pwd):/home/workspace" -p 5173:5173 $IMAGE_NAME