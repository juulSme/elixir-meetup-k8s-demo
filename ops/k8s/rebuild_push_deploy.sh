#!/bin/bash

# assumes microk8s is running with registry enabled on localhost:32000

if [ -z ${1+x} ]; then echo "Specify the image version"; exit 1; else echo "Image version is set to '$1'"; fi

REPOSITORY_URI=localhost:32000/demo
IMAGE_TAG=$REPOSITORY_URI:$1
THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
DEPLOYMENT_SPEC=$THIS_DIR/public/deployment.yml

echo "Building image $IMAGE_TAG"
docker build -f $THIS_DIR/../dockerfiles/k8s.dockerfile -t $IMAGE_TAG $THIS_DIR/../../

echo "Pushing image $IMAGE_TAG"
docker push $IMAGE_TAG

echo "Redeploying..."
sed -i 's@\(image:\s*\).*@image: '"$IMAGE_TAG"'@' $DEPLOYMENT_SPEC
kubectl apply -f $THIS_DIR/private
kubectl apply -f $THIS_DIR/public