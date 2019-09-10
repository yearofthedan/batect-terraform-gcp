#! /usr/bin/env sh
set -euo pipefail

IMAGE_NAME=web
TAG=$(git rev-parse HEAD)
IMAGE_PATH=gcr.io/"$PROJECT_NAME"/"$IMAGE_NAME"

docker build -t "$IMAGE_PATH":latest ./app
docker tag      "$IMAGE_PATH":latest "$IMAGE_PATH":"$TAG"

# shellcheck disable=SC2002
cat /secret/service-account.json | docker login -u _json_key --password-stdin https://gcr.io

docker push "$IMAGE_PATH":latest
docker push "$IMAGE_PATH":"$TAG"
