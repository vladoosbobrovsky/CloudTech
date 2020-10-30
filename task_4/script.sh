#!/bin/bash

IP=$(aws ec2 describe-instances | grep  "PublicIp" | grep -E '[0-9]{1,4}' | tr -d '",' | tr -d '[a-z,:,A-Z]' | tr -d ' ' | tail -1)
USER=ubuntu
terraform apply --auto-approve

ssh -i ~/Downloads/devops.pem $USER@$IP

