###  Batect - nginx hosted app on gcp with terraform
Requires some environment variables to be provided. I used a git ignored envSource.sh for mine. 

`PROJECT_NAME` the name of the project. Used for creating infra.
`CLUSTER_NAME` the name of the cluster to be deployed to. Shared across infra and deploy scripts.
`TERRAFORM_STATE_STORE` the name of the terraform store. Refers to the bucket in gcp for creating, and future use. 
