echo $version
source ./buildvars 

echo ${{ github.repository_owner }}

IMAGE_ID=ghcr.io/${{ github.repository_owner }}/$IMAGE_NAME 
IMAGE_ID=$(echo $IMAGE_ID | tr '[A-Z]' '[a-z]') 

echo $IMAGE_ID

for n in "${!domains[@]}" 
do 
  docker build --no-cache --build-arg CLOUDFLARED_VERSION=$version --build-arg DOMAIN=${domains[$n]} \
    -t $IMAGE_NAME-${domains[$n]}:$version \ 
    -t $IMAGE_NAME-${domains[$n]}:latest . 
  echo IMAGE_ID=$IMAGE_ID 
  echo version=$version 
  docker push --all-tags $IMAGE_ID-${domains[$n]}
done
