## JUMIA DEVOPS CHALLENGE
# Prerequisite
- aws cli
- terraform cli
- docker
- ansible
- kubectl
- eksctl

---
## Overview
---Make sure you have the prerequisites installed on your linux or unix system 
## Terraform tfstate s3 setup
* change the region variable region on the variables.tf and on provider.tf, so the tfstate will be saved on s3. That variable will also be used to deploy your infra on AWS
* change the bucket name on main.tf and provider.tf to your desired name
* create a bucket with that name, versioned and public block all properties
* terraform init
## Environment variables
* change terraform/script/.env-setup.sh to your desired values. This can be used by terraform and ansible, later on

## Deploy AWS infra
./run_terraform.sh

## Deploy eks controllers, IAM policies and roles, eks service accounts and ops services
./run_ansible.sh

To create a postgres database username and password and run sql queries, use the hostname displayed on the console output and then follow 




---

