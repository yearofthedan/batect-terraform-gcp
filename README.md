###  Batect - nginx hosted app on heroku with terraform
Requires some environment variables to be provided. I used a git ignored envSource.sh for mine. 

`WEB_APP` the name of the app to be hosted in heroku
`TERRAFORM_STATE_APP` the name of the app just holding the terraform state in heroku
`TERRAFORM_REMOTE_DB_URL` where we'll be storing the terraform state. You can get this after the pg db has been created 
