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
* on terraform fir, change the region variable region on the variables.tf and on provider.tf, so the tfstate will be saved on s3. That variable will also be used to deploy your infra on AWS
* change the bucket name on state/main.tf and state/provider.tf to your desired name
* create a bucket with that name, versioned and public block all properties
* cd state; terraform init # install all terraform dependencies for the state file
* cd ..
* terraform init # install all terraform dependencies for the main project

## Environment variables
* change terraform/script/.env-setup.sh to your desired values. This can be used by terraform and ansible, later on

## Deploy AWS infra
* on the repo root folder, just as an example command with the required params
* ./run_terraform.sh

## Deploy eks controllers, IAM policies and roles, eks service accounts and ops services
* On the root repo folder
* ./run_ansible.sh


---

