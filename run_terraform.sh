source terraform/scripts/.env-setup.sh
cd terraform
terraform apply -var account_id=$ACCOUNT_ID -var key_name="jumia" -var aws_profile=$AWS_PROFILE -lock=false
