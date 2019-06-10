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
docker build -f Dockerfile -t $TRAVIS_REPO_SLUG:$TAG .
echo "Step 3: Push"
docker push $DOCKER_USER/$TRAVIS_REPO_SLUG:$TAG
