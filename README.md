###  Batect - nginx served app on gcp with terraform

This is a sample project setup of an nginx served app with backend server. There are terraform scripts for hosting on Google Kubernetes engine. 

Tasks are all managed through Batect, so checkout `batect.yml` for the full listing.

## Prerequisites 

Any tasks which access GCP need service account credentials. Relevant scripts look for these under (gitignored path): `/secret/service-account.json` 

There are also some environment variables you'll need.

- `PROJECT_NAME` the name of the project. Used for creating infra.
- `CLUSTER_NAME` the name of the cluster to be deployed to. Shared across infra and deploy scripts.
- `LB_STATIC_IP` a pre-made static ip to be used with the load balancer. Used for deployments. 
- `TERRAFORM_STATE_STORE` the name of the terraform store. Refers to the bucket in gcp to create, and use in the future use. 
