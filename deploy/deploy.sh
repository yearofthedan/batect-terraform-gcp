#! /usr/bin/env sh
set -euo pipefail

IMAGE_NAME=web
TAG=$(git rev-parse HEAD)
IMAGE_PATH=gcr.io/"$PROJECT_NAME"/"$IMAGE_NAME":"$TAG"

echo Activating gcloud with k8s
gcloud config set project "${PROJECT_NAME}"
gcloud auth activate-service-account --key-file /secret/service-account.json
gcloud container clusters get-credentials "${CLUSTER_NAME}" --region us-west1-a

echo Deploying update via kubectl for image: "$IMAGE_PATH"
# shellcheck disable=SC2002
cat ./deploy/app-deployment.yml | sed "s~{{IMAGE_PATH}}~$IMAGE_PATH|{{LB_STATIC_IP}}~$LB_STATIC_IP~g" | kubectl apply -f -
kubectl get service
