#! /usr/bin/env sh
set -euo pipefail

IMAGE_NAME=web
TAG=$(git rev-parse HEAD)
IMAGE_PATH=gcr.io/"$PROJECT_NAME"/"$IMAGE_NAME"

gcloud config set project "${PROJECT_NAME}"
gcloud auth activate-service-account --key-file /secret/service-account.json

kubectl create deployment "$CLUSTER_NAME" --image=gcr.io/"$IMAGE_PATH":"$TAG"
