#! /usr/bin/env sh

gcloud config set project "${PROJECT_NAME}"
gcloud auth activate-service-account --key-file /secret/service-account.json
gsutil mb gs://"${TERRAFORM_STATE_STORE}"/
