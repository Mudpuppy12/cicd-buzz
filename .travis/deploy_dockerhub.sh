#!/bin/sh

echo "Running Docker build" 
echo "STEP 1: Login"
docker login -u $DOCKER_USER -p $DOCKER_PASS

if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi

# This is because docker name does not match github username

REPO=`echo $TRAVIS_REPO_SLUG | cut -f2 -d "/"`

echo "Step 2: Build"
docker build -f Dockerfile -t $DOCKER_USER/$REPO:$TAG .
echo "Step 3: Push"
docker push mudpuppy/$REPO:$TAG
