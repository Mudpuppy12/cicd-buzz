#!/bin/sh

echo "Running Docker build" 
echo "STEP 1: Login"
docker login -u $DOCKER_USER -p $DOCKER_PASS

if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi

echo "Step 2: Build"
docker build -f Dockerfile -t mudpuppy/cicd-buzz:$TAG .
echo "Step 3: Push"
docker push mudpuppy/cicd-buzz:$TAG
