source terraform/scripts/.env-setup.sh
cd terraform/ansible
ansible-playbook setup-eks.yml --extra-vars='ACCOUNT_ID=$ACCOUNT_ID CLUSTER_NAME=$CLUSTER_NAME PROFILE=$PROFILE REGION=$REGION'