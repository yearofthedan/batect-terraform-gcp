#! /usr/bin/env sh
set -euo pipefail

IMAGE_NAME=web
TAG=$(git rev-parse HEAD)
IMAGE_PATH=gcr.io/"$PROJECT_NAME"/"$IMAGE_NAME":"$TAG"

echo Activating gcloud
gcloud config set project "${PROJECT_NAME}"
gcloud auth activate-service-account --key-file /secret/service-account.json

gcloud container clusters get-credentials "${CLUSTER_NAME}" --region us-west1-a

echo Deploying with kubectl

kubectl create deployment "${CLUSTER_NAME}-web" --image="$IMAGE_PATH"
kubectl expose deployment "${CLUSTER_NAME}-web" --type=LoadBalancer --port 80 --target-port "$PORT"
kubectl get service
