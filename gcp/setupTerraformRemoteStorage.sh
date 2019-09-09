#! /usr/bin/env sh
BUCKET_NAME=${PROJECT_NAME}-tf-state

gcloud config set project "${PROJECT_NAME}"
gcloud auth activate-service-account --key-file /secret/service-account.json
gsutil mb gs://"${BUCKET_NAME}"/
